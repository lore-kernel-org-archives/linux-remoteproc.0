Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793237929;
	b=z46XiNwK7jHaiUllolqC59tnQInNX3LlJrfeVLzIXiAEyj6xo6aKPuJLMgY57DMlmNzK
	 CbelQRgPxmdXti3/YeRHakCpO9/WtEf7QGZoUo9yc5qtHcWuRqQuhusuddcT8/ReaXJry
	 YJ7NWT1/sJlvra/eIlBzojay9yUIQM+xXYPQayHuqhpWEYcff38pAOf/TQJgjD+cBUfda
	 s0PkzI/RP0vtZ4Bu/rtFpHvWudRB57dBmoG9glRAyqac9mta7ShYaqxHkFZa3LYTkZdiU
	 nDHi1NeU33DvYf+rPOTFAlt6RkCYBmhrPOwc4enWyNSHbzZ03Tx8DwSQ5CRA3PCnguw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793237929;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=EOs04QSJXkpqukLkDiiMN3/l/AZfTjlV7qiVUsZE4wE=;
	b=AeQznwiJiUSbDhM0yb4YeqvPOOqziQ6MawcPmRWihzvEpgAE4dVuIg9qi8hTLTNFtjGO
	 hOdGaNpBINkUeJE9gm5SNE9ypSlWM6BJuPEbwUcV7RMfdaWutfgEUgx99cenWZ6X+ySUZ
	 a7V6EweBL3CVn8mJ750jhBk1ov1t11K/1i8QCbDXCVlgkUQtLyMr91XT9zPqI41l7zXip
	 S8fML232pN8hJF+sbTqXcq7FrOtXQiV/d4611U6dcfeWqCuaBpf+Jw3gvGo2l6G2qi5mg
	 zKaZlGAMnyM1e4cVLnolact9UTiarhnpmakKuETBof154AQF38ZVwk91fWhFiyiWeKQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=grk3GLND;
	arc=none smtp.remote-ip=209.85.221.50
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8FCA606A321
	for <linux-remoteproc@vger.kernel.org>; Thu, 29 Oct 2026 01:38:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A8FCA606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=grk3GLND
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-48bbb06e746so709516f8f.3
        for <linux-remoteproc@vger.kernel.org>; Wed, 28 Oct 2026 18:38:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793237927; x=1793842727; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EOs04QSJXkpqukLkDiiMN3/l/AZfTjlV7qiVUsZE4wE=;
        b=grk3GLNDCCoeOl1TvUGmpR8xJPm8Z4YDkmEpvSd+S6BYMJm859V9LcT+pBH+rGfgrQ
         JrBGAFMGbyq11Dh+Vr/VLtSqAYnnrNS3gUoxraHyEs0gSlIipr9qTCYN5jQVspwzIQWV
         osth8sbzSEgaG6hFpuPlxfV1KveQTe45a2N44VdAuHfTQuIaZpIgYnYVS3z3hK+tuPy+
         TGmB65KBOd3dXZl+UT3epg9Nv+Z1M1DG0oap9YiVnvzzzyuLvmbJEW917s/5iZ9dr/7f
         CoWS6ObSIGhsHhgUVHPoaMh9trWc0pC2auq4IOGHx+JUD88TAzSuZMls53fyOUQcSEJM
         GD9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793237927; x=1793842727;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=EOs04QSJXkpqukLkDiiMN3/l/AZfTjlV7qiVUsZE4wE=;
        b=BIzumcT+5SbMnZA/41dlMDoOn1UiWrzyaFKLxdZpMJnG9uLscxrARV38wAPjkvrTO4
         1jtrS8L//TKEafOpBh1PGh9Mn+XnaBo8x5RsKNV3lf96q2F0TNWyI1pqdvg9THmOin4S
         SEvo+sAEJySinfug5EKodOYah2XZddIUXLSWmbXUErhXHJRiD2QZMQQ6eidhuXtPp4dT
         6HNc2luKjJ0QS0Rtkwfz07AjadDbTTznp3IATlzDQuCcf2I1djURJUF0huYIWUR9f1h8
         bD0kQNOQD6pzV0js4PTqBM+GsxHQbWpC4R1gAZaMH7PpzYlW2oZ4Jj0OXD4IxIS9RorP
         wUnw==
X-Forwarded-Encrypted: i=1; AKwUvByRUFN70NXT3m2TW/CKBDHbMburPcUSPk37rWuXXpHbddBQhNCBKatkQ0reKm2+FB49F6e845CDNzidnPEqrSwO@vger.kernel.org
X-Gm-Message-State: AFq9FYJlW8S5zwmlfw4A80Bn7e7RbHURX2trfPxUD2VA2f1UYAl9A2wL
	5kbq2XcxsYB4DJKUVgmYOaXHTMM1xnIRxgCVIXoipEWkO50Zn7JNWI41znWRmub3Fhg=
X-Gm-Gg: AYBFou15N1ZXa/Uc4BKRa16EwdV0ISUktDhO9iufVqf7TW9bUsyxxrWQbxrkwg/EUIn
	SmnrmTluZXPgb7Tvr5FVw9i0uA4YhHtVHkk4VpNliU2uuhkelSx8U+mEx48AbzYVWaVrvIqXWQc
	n3sPmYkQ721xlAuWJMR8Wr/hKT1Cmqu05hUbiHq/AINDVp4qpWQ13d+D6V0dapVOjx69jY1lhgx
	C3zdksyu6inC/1ULdYBlWfg8yJUavYsxWtmnwekn2N3OiCuEGatpTXn/ap5Gd+8R28vMz4JhX9z
	bq2ehfZgwvLOzBrmYFcWHNOEsfa7PXtsXoxxbtUMN6u1SJ/TAR6mfTm25/mAQEfBSpAsCJyRLVA
	giVQO517ZqUMQiXhVbL6qZCaVjmjk3vRd/g/QVYIbzTqAA8frZhF2V+q02ShZBo1LP3pQI4N07R
	cQ2eWTg17Q2GGqlq36N2vKOAjlt0EgNeq0e5t35CQl6HTIv+6Mtf2iPeZpXOj134PXrXQWRpLCF
	XrArTQzmbdAKxRDEu4A6qqJlEi7VOwUAcEoJDmjE8p341eylbnetLxJlC+vP3f+6X+DMFeNeHNn
	dqcCBb1beOAWdwrTLdtrMebKhVBztSjtZdSMuQf95IHGjVc/ZIez4v/nkPIkll8wIKbbypm6oNK
	6xTZc7NzeDnUDqMSJelyv4y6DV7mQOOIDcxhOrih9MiZcolj2YOQCoEoLv63CD2MsD1Et7QYpbQ
	gw8w==
X-Received: by 2002:a05:6000:719:b0:488:88ec:59c3 with SMTP id ffacd0b85a97d-48e5d5b53f4mr9121122f8f.14.1793237926737;
        Wed, 28 Oct 2026 18:38:46 -0700 (PDT)
Received: from MacBook-Pro-von-Karl.localdomain (dynamic-077-007-226-156.77.7.pool.telefonica.de. [77.7.226.156])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ecd8ddasm34154098f8f.48.2026.10.28.18.38.45
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 28 Oct 2026 18:38:46 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Jonathan Corbet <corbet@lwn.net>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	=?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	Randy Dunlap <rdunlap@infradead.org>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Alexander Usyskin <alexander.usyskin@intel.com>,
	Dominik Brodowski <linux@dominikbrodowski.net>,
	Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Alex Shi <alexs@kernel.org>,
	Yanteng Si <si.yanteng@linux.dev>,
	Dongliang Mu <dzm91@hust.edu.cn>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Danilo Krummrich <dakr@kernel.org>,
	Takashi Sakamoto <o-takashi@sakamocchi.jp>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	linux-pci@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-remoteproc@vger.kernel.org
Subject: [PATCH v4 0/2] Documentation: Restore device-ID documentation
Date: Thu, 29 Oct 2026 02:37:15 +0100
Message-Id: <cover.1793221199.git.kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Post: <mailto:linux-remoteproc@vger.kernel.org>
List-Help: <mailto:linux-remoteproc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-remoteproc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This v4 addresses the duplicate PCI declaration warnings Jonathan
reported on v3.

Patch 1 retains Uwe's device-ID documentation restoration. Patch 2
corrects the Chinese PCI header path and preserves its existing plain
references. The kernel-doc blocks added in v3 are dropped, with generated
API documentation deferred to a separate change.

A focused Sphinx 8.2.3 build with -W includes the complete English and
Chinese PCI pages together. It reproduces both warnings with v3 and
passes without warnings after each v4 patch.

Changes since v3:
  https://lore.kernel.org/r/20260908070031.32833-1-kmehltretter@gmail.com/
- Move the Chinese PCI changes to patch 2. The five files in patch 1 are
  unchanged from v3.
- Clarify the ACPI exclusion in patch 1's commit message using Uwe's
  explanation to Andy. Only ACPI_DEVICE_CLASS() has kernel-doc in that
  header.
- Retain Randy's review and test tags from v2 on patch 1.

Changes since v2:
  https://lore.kernel.org/r/ede7ce64f20e10660ebf6bc1b41836dad750ae3b.1783349758.git.ukleinek@kernel.org/
- Use the :file: role in pcmcia/driver.rst (Randy) and explain why acpi.h
  is excluded.

Documenting struct mei_cl_driver in include/linux/mei_cl_bus.h remains
a separate follow-up.

Report: https://lore.kernel.org/r/87h5jq8gia.fsf@trenco.lwn.net/

Karl Mehltretter (1):
  docs/zh_CN: PCI: Update the pci_device_id header reference

Uwe Kleine-König (The Capable Hub) (1):
  Documentation: Update after split of <linux/mod_devicetable.h>

 Documentation/PCI/pci.rst                     |  2 +-
 Documentation/driver-api/basics.rst           | 31 +++++++++++++++++--
 .../driver-api/mei/mei-client-bus.rst         | 12 ++-----
 Documentation/pcmcia/driver.rst               |  2 +-
 Documentation/staging/rpmsg.rst               |  2 +-
 Documentation/translations/zh_CN/PCI/pci.rst  |  2 +-
 6 files changed, 36 insertions(+), 15 deletions(-)

base-commit: 5b0764a53235d3c77e1ed674e836e1b3fe1a4b1f
