@TestOn('browser')
library matrix_test;

import 'dart:math';
import 'package:test/test.dart';
import 'package:stagexl/stagexl.dart';

void main() {
  test('new matrix', () {
    var m = Matrix(0.269, 0.283, 0.313, 0.479, 0.659, 0.701);
    verifyMatrix(m, 0.269, 0.283, 0.313, 0.479, 0.659, 0.701);
  });

  test('Matrix.det', () {
    var m = Matrix(0.269, 0.283, 0.313, 0.479, 0.659, 0.701);
    expect(m.det, closeTo(0.04027, 0.00001));
  });

  test('Matrix.fromIdentity', () {
    var m = Matrix.fromIdentity();
    verifyMatrix(m, 1, 0, 0, 1, 0, 0);
  });

  test('Matrix.clone', () {
    var m = Matrix(0.269, 0.283, 0.313, 0.479, 0.659, 0.701);
    var n = m.clone();
    verifyMatrix(n, 0.269, 0.283, 0.313, 0.479, 0.659, 0.701);
  });

  test('Matrix.cloneInvert', () {
    var m = Matrix(0.269, 0.283, 0.313, 0.479, 0.659, 0.701);
    var n = m.cloneInvert();
    verifyMatrix(n, 11.89412, -7.02721, -7.77215, 6.67958, -2.38995, -0.05145);
  });

  test('Matrix.deltaTransformPoint', () {
    // ToDo
  });

  test('Matrix.transformPoint', () {
    // ToDo
  });

  test('Matrix.transformVector', () {
    // ToDo
  });

  test('Matrix.createBox1', () {
    var m = Matrix.fromIdentity();
    m.createBox(0.269, 0.479);
    verifyMatrix(m, 0.269, 0, 0, 0.479, 0, 0);
  });

  test('Matrix.createBox2', () {
    var m = Matrix.fromIdentity();
    m.createBox(0.269, 0.479, pi / 8, 0.659, 0.701);
    verifyMatrix(m, 0.24852, 0.10294, -0.18331, 0.44254, 0.659, 0.701);
  });

  test('Matrix.identiy', () {
    var m = Matrix(0.269, 0.283, 0.313, 0.479, 0.659, 0.701);
    m.identity();
    verifyMatrix(m, 1, 0, 0, 1, 0, 0);
  });

  test('Matrix.invert', () {
    var m = Matrix(0.269, 0.283, 0.313, 0.479, 0.659, 0.701);
    m.invert();
    verifyMatrix(m, 11.89412, -7.02721, -7.77215, 6.67958, -2.38995, -0.05145);
  });

  test('Matrix.rotate', () {
    // ToDo
  });

  test('Matrix.skew', () {
    // ToDo
  });

  test('Matrix.scale', () {
    var m = Matrix(0.269, 0.283, 0.313, 0.479, 0.659, 0.701);
    m.scale(0.521, 0.829);
    verifyMatrix(m, 0.14015, 0.23461, 0.16307, 0.39709, 0.34334, 0.58113);
  });

  test('Matrix.translate', () {
    var m = Matrix(0.269, 0.283, 0.313, 0.479, 0.659, 0.701);
    m.translate(0.521, 0.829);
    verifyMatrix(m, 0.269, 0.283, 0.313, 0.479, 1.180, 1.530);
  });

  test('Matrix.prependTranslation', () {
    var m = Matrix(0.269, 0.283, 0.313, 0.479, 0.659, 0.701);
    m.prependTranslation(0.521, 0.829);
    verifyMatrix(m, 0.269, 0.283, 0.313, 0.479, 1.05863, 1.24553);
  });

  test('Matrix.setTo', () {
    var m = Matrix.fromIdentity();
    m.setTo(0.269, 0.283, 0.313, 0.479, 0.659, 0.701);
    verifyMatrix(m, 0.269, 0.283, 0.313, 0.479, 0.659, 0.701);
  });

  test('Matrix.copyFrom', () {
    var m = Matrix(0.269, 0.283, 0.313, 0.479, 0.659, 0.701);
    var n = Matrix.fromIdentity();
    n.copyFrom(m);
    verifyMatrix(n, 0.269, 0.283, 0.313, 0.479, 0.659, 0.701);
  });

  test('Matrix.concat', () {
    var m = Matrix(0.269, 0.283, 0.313, 0.479, 0.659, 0.701);
    var n = Matrix(0.569, 0.521, 0.829, 0.983, 0.241, 0.677);
    m.concat(n);
    verifyMatrix(m, 0.38767, 0.41834, 0.57519, 0.63393, 1.19710, 1.70942);
  });

  test('Matrix.prepend', () {
    var m = Matrix(0.269, 0.283, 0.313, 0.479, 0.659, 0.701);
    var n = Matrix(0.569, 0.521, 0.829, 0.983, 0.241, 0.677);
    m.prepend(n);
    verifyMatrix(m, 0.31613, 0.41059, 0.53068, 0.70546, 0.93573, 1.09349);
  });

  test('Matrix.copyFromAndConcat', () {
    var m = Matrix(0.269, 0.283, 0.313, 0.479, 0.659, 0.701);
    var n = Matrix(0.569, 0.521, 0.829, 0.983, 0.241, 0.677);
    var o = Matrix.fromIdentity();
    o.copyFromAndConcat(m, n);
    verifyMatrix(o, 0.38767, 0.41834, 0.57519, 0.63393, 1.19710, 1.70942);
  });

  test('Matrix.invertAndConcat', () {
    var m = Matrix(0.269, 0.283, 0.313, 0.479, 0.659, 0.701);
    var n = Matrix(0.569, 0.521, 0.829, 0.983, 0.241, 0.677);
    m.invertAndConcat(n);
    verifyMatrix(m, 0.94220, -0.71091, 1.11502, 2.51674, -1.16153, -0.61874);
  });

  test('Matrix.copyFromAndInvert', () {
    var m = Matrix(0.269, 0.283, 0.313, 0.479, 0.659, 0.701);
    var n = Matrix.fromIdentity();
    n.copyFromAndInvert(m);
    verifyMatrix(n, 11.89412, -7.02721, -7.77215, 6.67958, -2.38995, -0.05145);
  });
}

void verifyMatrix(Matrix m, num a, num b, num c, num d, num tx, num ty) {
  expect(m.a, closeTo(a, 0.00001));
  expect(m.b, closeTo(b, 0.00001));
  expect(m.c, closeTo(c, 0.00001));
  expect(m.d, closeTo(d, 0.00001));
  expect(m.tx, closeTo(tx, 0.00001));
  expect(m.ty, closeTo(ty, 0.00001));
}
