module.exports = provider =
  selector: '.symbol.ruby'
  inclusionPriority: 10
  excludeLowerPriority: false

  completions:

    synth: [
      "beep", "blade", "bnoise", "cnoise", "dark_ambience", "dsaw", "dull_bell",
      "fm", "gnoise", "growl", "hollow", "hoover", "mod_beep", "mod_dsaw",
      "mod_fm", "mod_pulse", "mod_saw", "mod_sine", "mod_tri", "noise", "piano",
      "pnoise", "pretty_bell", "prophet", "pulse", "saw", "sine", "square",
      "subpulse", "supersaw", "tb303", "tri", "zawa"]

    fx: [
      "bitcrusher", "bpf", "compressor", "distortion", "echo", "flanger", "hpf"
      "ixi_techno", "krush", "level", "lpf", "nbpf", "nhpf", "nlpf",
      "normaliser", "nrbpf", "nrhpf", "nrlpf", "pan", "panslicer",
      "pitch_shift", "rbpf", "reverb", "rhpf", "ring_mod", "rlpf", "slicer",
      "wobble"]

    sample: [
      "ambi_choir", "ambi_dark_woosh", "ambi_drone", "ambi_glass_hum",
      "ambi_glass_rub", "ambi_haunted_hum", "ambi_lunar_land", "ambi_piano",
      "ambi_soft_buzz", "ambi_swoosh", "bass_dnb_f", "bass_drop_c",
      "bass_hard_c", "bass_hit_c", "bass_thick_c", "bass_trance_c",
      "bass_voxy_c", "bass_voxy_hit_c", "bass_woodsy_c", "bd_808", "bd_ada",
      "bd_boom", "bd_fat", "bd_gas", "bd_haus", "bd_klub", "bd_pure", "bd_sone",
      "bd_tek", "bd_zome", "bd_zum", "drum_bass_hard", "drum_bass_soft",
      "drum_cymbal_closed", "drum_cymbal_hard", "drum_cymbal_open",
      "drum_cymbal_pedal", "drum_cymbal_soft", "drum_heavy_kick",
      "drum_snare_hard", "drum_snare_soft", "drum_splash_hard",
      "drum_splash_soft", "drum_tom_hi_hard", "drum_tom_hi_soft",
      "drum_tom_lo_hard", "drum_tom_lo_soft", "drum_tom_mid_hard",
      "drum_tom_mid_soft", "elec_beep", "elec_bell", "elec_blip", "elec_blip2",
      "elec_blup", "elec_bong", "elec_chime", "elec_cymbal", "elec_filt_snare",
      "elec_flip", "elec_fuzz_tom", "elec_hi_snare", "elec_hollow_kick",
      "elec_lo_snare", "elec_mid_snare", "elec_ping", "elec_plip", "elec_pop",
      "elec_snare", "elec_soft_kick", "elec_tick", "elec_triangle",
      "elec_twang", "elec_twip", "elec_wood", "guit_e_fifths", "guit_e_slide",
      "guit_em9", "guit_harmonics", "loop_amen", "loop_amen_full",
      "loop_breakbeat", "loop_compus", "loop_garzul", "loop_industrial",
      "loop_mika", "misc_burp", "misc_rand_noise", "perc_bell", "perc_snap",
      "perc_snap2", "sn_dolf", "sn_dub", "sn_zome"]

  getSuggestions: ({editor, bufferPosition, scopeDescriptor, prefix}) ->
    return new Promise (resolve) =>
      suggestions = []
      for type, list of @completions
        for sample in list when sample.substring(0, prefix.length) == prefix
          suggestions.push
            text: sample, type: 'snippet', rightLabel: "Sonic Pi #{type}"
      resolve(suggestions)
