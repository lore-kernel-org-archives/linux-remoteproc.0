Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B246D1CF2A1;
	Wed, 23 Oct 2024 16:21:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729700518; cv=none; b=qPDG6ec1oSjgoObQ2esl8jaTIaWUmc8cfuGpg3QsTWqX8rL5fNUkgRxCq4rRvPCKqf87ldFGveF5MELxP9ZhLmyJ31TFIXdJZjjLgG8LFPN2k/oN0luyZU10K6uovCLhw/ou/168FTvBcX8HzfYk3oKipo2qAl0fSMEZIBNB3b8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729700518; c=relaxed/simple;
	bh=aD4ZDGMB/0Exiwv1vFpmzxZEkElwM8K5XNyCEfr/VBE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=e9Jwmod/Yew41PnZf0qEeufG9mo/JgYuwAHUCwM1IzVHno3e4ZLmGUGd6GQvKvdWY8o54YH0cuPBiXozeFc2MVuZIx2XeRdJQC16DbdTprez1nX9doP2vBZps11azQHgsSuppx7ZWslBW4aUNb04zfxpW6+73LM2BUwcaUOpSs0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UISUMDWA; arc=none smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UISUMDWA"
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-2fb599aac99so70507491fa.1;
        Wed, 23 Oct 2024 09:21:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729700515; x=1730305315; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4T91d+bznCB7MrilGZZnGDp0TGLFXhhuyuq/BXHaJaU=;
        b=UISUMDWATK0Ma5p3GjGcRULvT/gcy/yl6rnMosu1zT/phkp+rBCQCOr3KOpTQ/yoyO
         s1iyn8nWoWfnCohLbkTFsvIndxWSe5e4bmgwbedLYfMvZR9x80uAgwg9cf8r04V6nN8K
         wRQes3nDB9cgdqd0WKbvSS//bPrd/WApaZf7LRZQnJtPjvTEwtM9FybmIabnv6X7Pfnq
         mIR7OqW8gAzVqJZ9tgEklUtLXp7RWlDtOCSPPZ8aU6O6JnD33j5POe3MAeCZSRtuznkg
         fAlVlpoBTA8V955u+qdQH+CxSeAplzeGLDlF2XpeOayMAkLqf0yWJHCkYZOciKgJAQQ6
         K7yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729700515; x=1730305315;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4T91d+bznCB7MrilGZZnGDp0TGLFXhhuyuq/BXHaJaU=;
        b=HsUNn5g2OfEipQ5Di8jlW+rZt9t6uf6EN1MvzRGTuFYnp2/zoMJjFVWtSDgKAi4f32
         N9b3TIizTpqsAUhbVRB1Ucpr4KygMjH2J9LAPdVtZco5/Ln89ZGhTmnXZURc39bE4xDL
         3N6YAxYXEM2F/tbHgBach8C/kv3nzH7JxSB5fOPCUuZ2otSqho11vsJYjEawkQg6ugW2
         QBDR9W8KljMgrOlJWgvPdsUJ/4FViq7SlRGINtuxVcQj/1yMFsbifdC5buf21CN27Hdo
         lfQqUuKZrB/gFazt/xFT612mUY9hT6b0Q4OO9vNV2+eyCl4o12JR4kP+axPsG4hSKANM
         6gXw==
X-Forwarded-Encrypted: i=1; AJvYcCUYAUUWpDKj4clk5sB5wCU8MMQpj9PAAK2/OEjmPVZ6pES4ik1Uz0LlVg74M6matf81yfoyGrEQHeVM@vger.kernel.org, AJvYcCUrDrxKmwrhScEyQbvCV9OfKUTQt7eYuAVqMjSkzZeilEy7daP9rRJttSImbcVvBiqHLt9TMUtgSi86Al0s@vger.kernel.org, AJvYcCVhPWdn7Fj0dsp4nun3phFL7tnHPj+qAJu1oSX6w/5713Of2fl48c2G9dxl/BpZvJqFRGvsdslqdNRSs6c=@vger.kernel.org
X-Gm-Message-State: AOJu0YwwCSVd4qeT1b1jjg3Bh/MolO+w03Uu1STqhLMj9tIJ/ux+9qjM
	YguvdnVBfAC6afxK0OkKDaXcmwJUw6Nl0y1bKo/fhClJOb1dkDjz
X-Google-Smtp-Source: AGHT+IGSuRDP9QiG7QKq9fGBE5EgHFrsYc0Z88Wu4omye9JKc34vnBuHAWvJD+QR/DERkoh54VOejA==
X-Received: by 2002:a2e:819:0:b0:2fb:c20:dbc3 with SMTP id 38308e7fff4ca-2fc9d5d4042mr14177941fa.39.1729700514531;
        Wed, 23 Oct 2024 09:21:54 -0700 (PDT)
Received: from playground.localdomain ([86.127.146.72])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5cb66c72609sm4588382a12.88.2024.10.23.09.21.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Oct 2024 09:21:53 -0700 (PDT)
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Peng Fan <peng.fan@nxp.com>,
	Mark Brown <broonie@kernel.org>,
	Takashi Iwai <tiwai@suse.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	Conor Dooley <conor+dt@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Iuliana Prodan <iuliana.prodan@nxp.com>
Cc: linux-remoteproc@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-sound@vger.kernel.org,
	sound-open-firmware@alsa-project.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/4] ASoC: dt-bindings: audio-graph-card2: add widgets and hp-det-gpios support
Date: Wed, 23 Oct 2024 12:21:12 -0400
Message-Id: <20241023162114.3354-3-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241023162114.3354-1-laurentiumihalcea111@gmail.com>
References: <20241023162114.3354-1-laurentiumihalcea111@gmail.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>

Introduce the 'widgets' property, allowing the creation of widgets from
4 template widgets: Microphone, Line, Headphone, and Speaker. Also
introduce the 'hp-det-gpios' property, which allows using headphone
detection using the specified GPIO.

Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
---
 .../devicetree/bindings/sound/audio-graph-card2.yaml     | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/audio-graph-card2.yaml b/Documentation/devicetree/bindings/sound/audio-graph-card2.yaml
index f943f90d8b15..f0300a08f7fe 100644
--- a/Documentation/devicetree/bindings/sound/audio-graph-card2.yaml
+++ b/Documentation/devicetree/bindings/sound/audio-graph-card2.yaml
@@ -37,6 +37,15 @@ properties:
   codec2codec:
     type: object
     description: Codec to Codec node
+  hp-det-gpios:
+    maxItems: 1
+  widgets:
+    description:
+      User specified audio sound widgets.
+      Each entry is a pair of strings, the first being the type of
+      widget ("Microphone", "Line", "Headphone", "Speaker"), the
+      second being the machine specific name for the widget.
+    $ref: /schemas/types.yaml#/definitions/non-unique-string-array
 
 required:
   - compatible
-- 
2.34.1

