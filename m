Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793237933;
	b=YRT54KqvPL4EHCbXmkrighZEGF7KY9PoYQeIR4KQIgbsIqExDo33ak+9eQecXEUQ4lwJ
	 gpXvVTXtSMqG9y7o40yWwu+J/zOvvYYEBUMXfs9UtLgG1TxrGJJ8Tip8NYFFqm7BgG2su
	 r3Plx+BMuyrZYPkHEI6XjcdRXRnLq/zYtUmMnaVyKrnmrRpsvTwLfSnolRms9d3/vHHHn
	 vQ34jdaE6wI+iOA7fFEjHfPSl4+CwrUG2h5iS9sTto2nWYzTjQJihViXjcDrL+lhnn4Sq
	 Hr7BpSAcL3bHT/LidqAwYbHxLvUS+c4RApWsHlzsuxAO3FP0mECcuRknIjFMWwZvELQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793237933;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=/cTHNomGdMzdwGOEPd/Mb+9dZ6EWwM9vGNpl5GZyT/s=;
	b=5hfr1aKyqb9MCKemdwxKolegtOeRVHMKgHXIoyN1HsNp+ELcCwyHrdAH5R/4LIu3AP8H
	 t2PqbMuL9oFzQiiFQHRK5d1J/UGjcZLJTiJ2Sj8ON3fzRf1o8Yl9UDiLSnJbFs/9lu9Zt
	 lWzGgqlixeMyGUnBpAofcBfmXY2/kAkg3je3mXkiOKychslNQdu5ERdIsN3bxFtQp+Orl
	 9uDB92s/Ozm9K4NyQGdU7IDyvoXZdCiZFXRsV7fc0C3DCO+FGSd25f4nopULWatLKrCAv
	 ngo4mDTWmWXJ0swqFVGe59Eo1/q1NuC7e3KEXfCDVk4K+EESfy8j2No7tVv5Bjl8sag==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=L6c+IPE+;
	arc=none smtp.remote-ip=209.85.221.47
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7DC1606A33D
	for <linux-remoteproc@vger.kernel.org>; Thu, 29 Oct 2026 01:38:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C7DC1606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=L6c+IPE+
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-48dfaa3fa12so122010f8f.0
        for <linux-remoteproc@vger.kernel.org>; Wed, 28 Oct 2026 18:38:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793237931; x=1793842731; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/cTHNomGdMzdwGOEPd/Mb+9dZ6EWwM9vGNpl5GZyT/s=;
        b=L6c+IPE+TusQzbodaS4Y8bDimeOge0wsfqMCW09n1Xz70yNq0U95vP2JdsERw5EuIU
         Aq9f9+D7DXAqUux6+m96MwkWa6k9MknozLsKMTQJHXERZo0mT+larlyUAIvXjTkFVuYm
         Cn0coLa4xlTb1kcTnZPWBvbr+evtFxizLmVV6BbCrrv/oswQl3iBu47c1Fk9XiNW7SEi
         R40Hc4C6LQEKRyArjcAeR7UtoinslXuLkB0cOe16olQBRR+6gmYAqVZ7v1tCeT/TE2s0
         dgVEM1YAG71RjPDbaDQJDAJMUv/nQAdazE4UpVLZLkjjwyzi56d1fX/Iupz7HP7mPYwO
         OlwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793237931; x=1793842731;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/cTHNomGdMzdwGOEPd/Mb+9dZ6EWwM9vGNpl5GZyT/s=;
        b=B5qXBGXBP7mlFWUxZhDfT+cAKTthzI2RQtqBWJEm/q8Ve48MR8/ZBX8ohfua56O/Nd
         SZy9jjzEkvzwyyWZ4pMOWSSlc1PyTIsYUjjHEAThhvWviLn5iF0Aynff43WzgLoyfDLS
         uQM3Cdld8HiXEctJWcASkDIRyfduPBF0ez2d2NKrFqaKQppcSnUO6Npgt30fI6SuAJue
         mxrDdLqyCgmT+QpVQJPJXO72GqSavFYxi9pGDfQ8OhISFhL6PWHAOGl8tylMJ2t3PuI/
         bmw+OQ3panNJRV5vM+QUL/gdbOsGNH9OJIeYfLDHT+1qwamVqp/geMMXpVM+CGd1rKx0
         TmGA==
X-Forwarded-Encrypted: i=1; AKwUvByTBEHD2Jmpxe8p/x0kfv6yPBvSfREUaCAkrYSFRYXpmeoEkd5xD4KNDoipYPn7YLqIaknAPGVAKzQgNfxJkhyQ@vger.kernel.org
X-Gm-Message-State: AFq9FYJFJPkfgE3S3RXQHlSZTCT/yMSginzZqQ3OlCp+IDTdhA9Kvr12
	7WB44mFLQ8eJ7280svVswooRfIAzN4tFtkorwvZF+WhR5/tl5xtbjDy7
X-Gm-Gg: AYBFou3PVcEZarrB7IAc0pBenPQy+Swng2S2zmBrEnnbLZj+xxOKwj9tsMtG5rc1lyk
	rHJzqQAfGZ/WZxBFc2VUkUFUf+oYg22i/nFRZQeFbaoqEvY/Q+MUcgn6bptNjkgZkDWoKGL0/qF
	PYIhfWR4/o0vLUjwwE4OTxJgSDDd9OLjaXx8EAhjDc7IRhvaRXWCQW2iJckPkjOzGUcZNT9rs64
	kr9yXqEM+4dUjQ5J4fg9pYpORG3AY4HltJm+r32PBRbvljznBUv7EnhX4YFoHD2cGiqqB7yh5z4
	uyqEpGnqFSQyAhfWD/1zCJAsipJ9ioDBpGboIX+VE877k+LgZPNTidBQPx5fEQsYxj88gXYJK+Z
	dfWkg6kjnEtGqB+b3jAC/6maLcr/Pnu6EAh9f1h0xiZ+bWuE/LGLpYXknFlob48ne82s2oxXrJm
	wAZJ52g8xTpdAljvSvxUdR3E4xWfPbklnWKvgqP2+LHrxtj1V3Iu1fizNZVQyB1uf+srxVc5rAH
	QRZm1vpx8IfmxjvWzN1pntF+mhad2MAGEy17gr8Q1sC43iGUiLyRnnGQkMHHLDkvUJMHke0HK7J
	350Je1ktrheQnpvHkEftgv75hkTVj1w2N4SHzXgzkQ5xAuh0iSaqAVvzEKXiFKZLTwpFgIdreRc
	oqXHJyx6xG6sCXXnO45LSOz/dBeP3p7rBMMHXIxqy+qrqR2qBTJfI4xM8FNTI0XenOOPzr2vgjk
	0Auleq0h4RjCGOXak1CqusqFU=
X-Received: by 2002:a5d:540c:0:b0:48a:fad8:52a2 with SMTP id ffacd0b85a97d-48e64ba60d3mr2291450f8f.23.1793237931074;
        Wed, 28 Oct 2026 18:38:51 -0700 (PDT)
Received: from MacBook-Pro-von-Karl.localdomain (dynamic-077-007-226-156.77.7.pool.telefonica.de. [77.7.226.156])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ecd8ddasm34154098f8f.48.2026.10.28.18.38.49
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 28 Oct 2026 18:38:49 -0700 (PDT)
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
Subject: [PATCH v4 2/2] docs/zh_CN: PCI: Update the pci_device_id header reference
Date: Thu, 29 Oct 2026 02:37:17 +0100
Message-Id: <203f4407e5ed5335cda17a74fa6aeac311a572d5.1793221199.git.kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <cover.1793221199.git.kmehltretter@gmail.com>
References: <cover.1793221199.git.kmehltretter@gmail.com>
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

struct pci_device_id moved from <linux/mod_devicetable.h> to
<linux/device-id/pci.h>. Update the header reference in the Chinese PCI
guide to match its new location.

Fixes: ad428f5811bd ("mod_devicetable.h: Split into per subsystem headers")
Assisted-by: LLM
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
 Documentation/translations/zh_CN/PCI/pci.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/translations/zh_CN/PCI/pci.rst b/Documentation/translations/zh_CN/PCI/pci.rst
index 347f5c3f5ce99bade1221f083b208972baf102ec..452e073b8c067ce16c76d9a5a5883532ebce3296 100644
--- a/Documentation/translations/zh_CN/PCI/pci.rst
+++ b/Documentation/translations/zh_CN/PCI/pci.rst
@@ -92,7 +92,7 @@ ID表是一个由 ``struct pci_device_id`` 结构体成员组成的数组，以
 
 该API在以下内核代码中:
 
-include/linux/mod_devicetable.h
+include/linux/device-id/pci.h
 pci_device_id
 
 大多数驱动程序只需要 ``PCI_DEVICE()`` 或 ``PCI_DEVICE_CLASS()`` 来设置一个
