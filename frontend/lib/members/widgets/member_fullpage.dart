import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:latwe_ustawy/members/widgets/attribute_widget.dart';
import 'package:latwe_ustawy/models/member_model.dart';
import 'package:latwe_ustawy/post/widgets/tag_badge.dart';

class MemberFullpage extends StatelessWidget {
  const MemberFullpage({super.key, required this.member});

  final MemberModel member;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Scaffold(
      appBar: AppBar(
        title: Text(member.firstLastName),
        shape: Border(
          bottom: BorderSide(
            color: Theme.of(context).colorScheme.outlineVariant.withAlpha(50),
            width: 1,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: colors.surfaceContainerLow,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: colors.onSurfaceVariant.withAlpha(20)),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  CachedNetworkImage(
                    imageUrl:
                        "https://api.sejm.gov.pl/sejm/term10/MP/${member.id}/photo",

                    // TO JEST KLUCZ DO SUKCESU:
                    imageBuilder: (context, imageProvider) => Container(
                      width: 128.0, // Ustaw wielkość
                      height: 128.0,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle, // Robi kółko
                        image: DecorationImage(
                          image: imageProvider,
                          fit: BoxFit
                              .cover, // Wypełnia kółko (nie spłaszcza zdjęcia)
                        ),
                      ),
                    ),

                    // Placeholder (kręciołek)
                    placeholder: (context, url) => const SizedBox(
                      width: 128,
                      height: 128,
                      child: CircularProgressIndicator(strokeWidth: 2),
                    ),

                    // Błąd (ikona)
                    errorWidget: (context, url, error) => const CircleAvatar(
                      radius: 20,
                      child: Icon(Icons.person),
                    ),
                  ),
                  Text(
                    member.firstLastName,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  Wrap(
                    spacing: 5,
                    runSpacing: 2,
                    alignment: WrapAlignment.start,
                    children: [
                      Text(
                        member.voivodeship,
                        style: TextStyle(
                          color: colors.onSurfaceVariant,
                          fontSize: 13,
                        ),
                      ),
                      Text(
                        "•",
                        style: TextStyle(
                          color: colors.onSurfaceVariant,
                          fontSize: 13,
                        ),
                      ),
                      Text(
                        member.profession,
                        style: TextStyle(
                          color: colors.onSurfaceVariant,
                          fontSize: 13,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 4), // Mały odstęp przed tagiem
                  TagBadge(tag: member.club),
                  AttributeWidget(
                    primary: "Aktywny",
                    secondary: member.active ? "Tak" : "Nie",
                  ),
                  AttributeWidget(
                    primary: "Data urodzenia",
                    secondary: member.birthDate,
                  ),
                  AttributeWidget(
                    primary: "Miejsce urodzenia",
                    secondary: member.birthLocation,
                  ),
                  AttributeWidget(
                    primary: "Miejsce",
                    secondary: member.districtName,
                  ),
                  AttributeWidget(
                    primary: "Numer okręgu wyborczego",
                    secondary: member.districtNum.toString(),
                  ),
                  AttributeWidget(
                    primary: "Wykształcenie",
                    secondary: member.educationLevel,
                  ),
                  AttributeWidget(primary: "Email", secondary: member.email),
                  AttributeWidget(
                    primary: "Liczba głosujących",
                    secondary: member.numberOfVotes.toString(),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
