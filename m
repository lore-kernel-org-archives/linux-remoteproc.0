Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1C40191F82;
	Wed,  6 Nov 2024 05:10:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730869829; cv=none; b=Neb9R2gjMt5egFKahNJl/FaFiYYiMCI0WPGTzBGVK4N0+nufzWv5p3uWt25AoqQ80jPuXELSU3+gYyCXD4aT8aodzH9jjNDSl3seDfiIJ2CcI70MhZPO75q6w1iNpIXHaIYLtv6m6bzIfE50OxUaofxLCn4GUc8Jpi/poNGABbk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730869829; c=relaxed/simple;
	bh=XRfi1H+SGAifDgT93Oh4LmBcUduLwdRaBm63B4FjTPk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=oMvtzVz6rgt4+Z7Nyw6Xh1Ks3+yD/3Lt/00e5EyxUZ/op9H48DaKpsPEfqOdkcXnJrdZzwWwoIWzONawvwjGcbGKGp69NbbkZkdx5JmkSgvNXIN8ryQM+mOw/F7B9la7E5ThuRGg1PjL/M4BUnswTaFm02DL5lMtJHM3hJDePAE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NJD9fF2j; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NJD9fF2j"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-210e5369b7dso63158385ad.3;
        Tue, 05 Nov 2024 21:10:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730869826; x=1731474626; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hakWmbGF5t6yCZezGDPznhi3RDsUgyCp9RDv0MZMLAU=;
        b=NJD9fF2j7hRCMcXKwa5Tj1MeAAOLnO7tJgE0oJwaPsFEN2c/mnnSZQB+IQAQGVW6MJ
         3+cHD5hmEV9aDxTrlKVsyDVrirAdjtWjYU4I6RKQuU4aOyffhHbudDDH7hcuBGMGggWr
         lSh4dA1deDwZp7DLHm889G+WsB/gt9Kuh+HJeD1lMC49nOhWBpaHapDzTAD1Ox4cbgun
         ollf9VirCcuLRVw4fSyfa/XzKa2YhTT+/zVUFvBuS3OsvULCXfLWq2RfMa4y2TKv8hl1
         6CqJyb9wGSwQndHE8F67BqELGoovR4SkwskpCTd0wffkSImFr6TRRNcJmzlrTkOBzX5b
         nunw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730869826; x=1731474626;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hakWmbGF5t6yCZezGDPznhi3RDsUgyCp9RDv0MZMLAU=;
        b=Z9z96ZMfSKzOt5+NQrMZUhAhR+mBo+V9aeF+FPtZvZLEvZTnBXdQ+2w18tkWNxglER
         73/KD14IMQy8NkTftCSVPl2/jlRQ9XexYujLUApXLWz7Hf4Qr+GBsTZ7UulDkoEpBC/b
         tCt/OcoBcnQNJoO08dP8cQtZD8aPH/cm3VAJggju0f52mOac8XubpcKdUMjRohiVqBd1
         fbt8NAkZUsp4pO/5YkFYzomJP/JNExY6/d3r22mlMtnyEDJC3oFZiBuZRaFBbL0hauiQ
         EDO/j1Yy9lY+cbmtEPTlToSlaUaEff4JS/b5nQnovJGS/TyxpkGJUzZP07pA+Izpj1EJ
         bSKA==
X-Forwarded-Encrypted: i=1; AJvYcCUN3NO4qxOrZmZBHoNJk7GQozYHq/C9B6KzFEwcAad2WAb6iPwRegIaK6YM/jLFiPBJio6KsIBa/RM=@vger.kernel.org, AJvYcCVukSykVBu3JX3Gxn14f2lohFtxei6+AVT+sKZ2rFXm9qaQVTjnXjJkv1s91oUnSXcaAsyL2807XQLprYxD2yDxvQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywz/mTXTUubTK4zAuw4wk80C6GDHON3Yq8tj6Oxzf4WKCIoyAQE
	KEw/T3cmAQZs1IQ9ncUOPGlSR+KID+ozDWeikY6dSbf8cfa5nf67
X-Google-Smtp-Source: AGHT+IE0ltik1+CPI5b1dk/B05Ru9LjtMOO0dIerIiRhuUzK5PfbS+uXLWNbFfLevDR7BKLKscjHrw==
X-Received: by 2002:a17:903:1054:b0:20e:55b0:3609 with SMTP id d9443c01a7336-2111af17690mr190576985ad.8.1730869826138;
        Tue, 05 Nov 2024 21:10:26 -0800 (PST)
Received: from anishs-Air.attlocal.net ([2600:1700:3bdc:8c10:f510:c8a3:8415:793d])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-211057c0825sm86266055ad.207.2024.11.05.21.10.24
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 05 Nov 2024 21:10:25 -0800 (PST)
From: anish kumar <yesanishhere@gmail.com>
To: andersson@kernel.org,
	mathieu.poirier@linaro.org,
	corbet@lwn.net
Cc: linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-remoteproc@vger.kernel.org,
	anish kumar <yesanishhere@gmail.com>
Subject: [RESEND PATCH V6 2/3] Documentation: remoteproc: add overview section
Date: Tue,  5 Nov 2024 21:10:15 -0800
Message-Id: <20241106051016.89113-3-yesanishhere@gmail.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
In-Reply-To: <20241106051016.89113-1-yesanishhere@gmail.com>
References: <20241106051016.89113-1-yesanishhere@gmail.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Added overview section which details
how the remote processor framework works and
how it handles crashes.

Signed-off-by: anish kumar <yesanishhere@gmail.com>
---
 Documentation/staging/remoteproc.rst | 43 ++++++++++++++++++++++++++++
 1 file changed, 43 insertions(+)

diff --git a/Documentation/staging/remoteproc.rst b/Documentation/staging/remoteproc.rst
index eeebbeca71de..e0bf68ceade8 100644
--- a/Documentation/staging/remoteproc.rst
+++ b/Documentation/staging/remoteproc.rst
@@ -46,6 +46,49 @@ of several key components:
 - **Virtio Support**: Facilitates interaction with the virtio and
   rpmsg bus.
 
+Overview
+========
+
+The framework begins by gathering information about the firmware file
+to be downloaded through the request_firmware function. It supports
+the ELF format and parses the firmware image to identify the physical
+addresses that need to be populated from the corresponding ELF sections.
+Once this information is obtained from the driver, the framework transfers
+the data to the specified addresses and starts the remote processor,
+along with subdevices.
+
+Dependent devices, referred to as `subdevices` within the framework,
+are also managed post-registration by their respective drivers.
+Subdevices can register themselves using `rproc_(add/remove)_subdev`.
+Non-remoteproc drivers can use subdevices as a way to logically connect
+to remote and get lifecycle notifications of the remote.
+
+The framework oversees the lifecycle of the remote and
+provides the `rproc_report_crash` function, which the driver invokes
+upon receiving a crash notification from the remote. The
+notification method can differ based on the design of the remote
+processor and its communication with the application processor. For
+instance, if the remote is a DSP equipped with a watchdog,
+unresponsive behavior triggers the watchdog, generating an interrupt
+that routes to the application processor, allowing it to call
+`rproc_report_crash` in the driver's interrupt context.
+
+During crash handling, the framework performs the following actions:
+
+a. Sends a request to stop the remote and any connected or
+   dependent subdevices.
+b. Generates a coredump, dumping all `resources` requested by the
+   remote alongside relevant debugging information. Resources are
+   explained below.
+c. Reloads the firmware and restarts the remote processor.
+
+If the `RPROC_FEAT_ATTACH_ON_RECOVERY` flag is set, the detach and
+attach callbacks of the driver are invoked without reloading the
+firmware. This is useful when the remote requires no
+assistance for recovery, or when the application processor can restart
+independently. After recovery, the application processor can reattach
+to the remote.
+
 User API
 ========
 
-- 
2.39.3 (Apple Git-146)

