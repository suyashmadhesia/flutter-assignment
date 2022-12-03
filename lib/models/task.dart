import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
class Task extends Equatable {
  final String title;
  final String description;
  final String id;
  const Task(
      {required this.title, required this.description, required this.id});

  @override
  List<Object?> get props => [title, description, id];

  String toJSON() {
    Map<String, dynamic> json = {
      'title': title,
      'description': description,
      'id': id,
    };
    return jsonEncode(json);
  }

  factory Task.fromJSON(String data) {
    Map<String, dynamic> json = jsonDecode(data);
    return Task(
      title: json['title'],
      description: json['description'],
      id: json['id'],
    );
  }
}
