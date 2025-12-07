import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:latwe_ustawy/members/widgets/member_fullpage.dart';
import 'package:latwe_ustawy/models/member_model.dart';
import 'package:latwe_ustawy/post/widgets/tag_badge.dart'; // Upewnij się co do importu
import 'package:lucide_icons_flutter/lucide_icons.dart';

class MemberThumbnail extends StatelessWidget {
  const MemberThumbnail({super.key, required this.member});

  final MemberModel member;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Material(
      color: colors.surfaceContainerLow,
      borderRadius: BorderRadius.circular(12), // Dodane dla estetyki
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute<void>(
              builder: (context) => MemberFullpage(member: member),
            ),
          );
        },
        borderRadius: BorderRadius.circular(
          12,
        ), // Żeby efekt fali nie wychodził poza rogi
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            spacing:
                10, // Odstęp między elementami (Avatar <-> Tekst <-> Strzałka)
            crossAxisAlignment:
                CrossAxisAlignment.center, // Wyrównanie w pionie
            children: [
              // 1. LEWA STRONA: AVATAR
              CachedNetworkImage(
                imageUrl:
                    "https://api.sejm.gov.pl/sejm/term10/MP/${member.id}/photo-mini",

                // TO JEST KLUCZ DO SUKCESU:
                imageBuilder: (context, imageProvider) => Container(
                  width: 40.0, // Ustaw wielkość
                  height: 40.0,
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
                  width: 40,
                  height: 40,
                  child: CircularProgressIndicator(strokeWidth: 2),
                ),

                // Błąd (ikona)
                errorWidget: (context, url, error) =>
                    const CircleAvatar(radius: 20, child: Icon(Icons.person)),
              ),

              // 2. ŚRODEK: TEKSTY (Rozciągnięte)
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      member.firstLastName,
                      style: const TextStyle(fontWeight: FontWeight.bold),
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
                  ],
                ),
              ),

              // 3. PRAWA STRONA: STRZAŁKA
              Icon(LucideIcons.chevronRight, color: colors.onSurfaceVariant),
            ],
          ),
        ),
      ),
    );
  }
}
