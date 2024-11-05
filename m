Received: from mail-oi1-f177.google.com (mail-oi1-f177.google.com [209.85.167.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BDCB20B20;
	Tue,  5 Nov 2024 00:48:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730767685; cv=none; b=gS2tcEVSFHu1YDAayLVR+9Up3f6NMs5Jv40aX9uDRfzxUO/Ym4bm4UBvdbtC3lMCGQQaraSiU0LF+I4kDLbvm8eXgUbq1lTFE7yvz99tRjsCOpQoRXwAgr8NVCZf0vxRhGkJaARdgoLF4UaBa6GlX11J7A2edSqbLEj+laaxb/8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730767685; c=relaxed/simple;
	bh=XRfi1H+SGAifDgT93Oh4LmBcUduLwdRaBm63B4FjTPk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=SwPq21u9F9LKiFmCdA6YvmlaUgjQP6pngyfgbqojrIxwcORWHI1jvTaGoQYg68mANzH4eeMFpqEG7zpuTUidoD/u6ttDt/xz5WEIRlJdcLeMwLF5O0hl92tObJHU5ufwz+EseIxE0lppTGDj0OJG7RoTMorIoeB4ehlHceONXww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ncgMTOEi; arc=none smtp.client-ip=209.85.167.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ncgMTOEi"
Received: by mail-oi1-f177.google.com with SMTP id 5614622812f47-3e60966297fso2449793b6e.1;
        Mon, 04 Nov 2024 16:48:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730767683; x=1731372483; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hakWmbGF5t6yCZezGDPznhi3RDsUgyCp9RDv0MZMLAU=;
        b=ncgMTOEi+4d+T6llBi8HsFdz69WMWYgGZOsVd6YSoikBaifk3PcDTpujJ1TorYkwBh
         FqXJBt0U5Ixw6N4J82tOdO5jq1NAi897f0pPpMrRBAgMGz4vmFGGl1ht6lpbQuciZoKg
         /kTOI+YkIf4DJM2gFi7mBZSkWJ28/KUPOHl24kf/oFGX/kqFWh0d99G4ZtTT1fI0FXfL
         E1sw5nL/68sjGHO51HRc/BlXJMKjZM6TSUd1mDcJ4pCQBN7M86qLk/yqgGv+RQII/pdf
         +gMSGI09zfIN9uiM2ZmI4z3bzXpqD7pBtl853oeSCamiyBl9tkef7SG8jGqXC1CYWBfl
         G3pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730767683; x=1731372483;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hakWmbGF5t6yCZezGDPznhi3RDsUgyCp9RDv0MZMLAU=;
        b=k20D7MRjLEupY6q+Zd89Ul1Gu/7XtzUKJQo1Y2XxFByezWW4q+p8lGP0Shw3EP15bN
         D1CORd2X8gdbV4SFiFcBa/pf4AYui+KzSGab7m0D21wnG0zDxgKLg+0Vvr60Ou7eLUJG
         sFfEPfdsD9k1qdq7BS5dNE0t43uXLDHdoa6/RUNMbTthHtGXr5wklrm475d1Iz1haZdz
         1x8k9y/FmFDQPLP1rXQuadSs3mutaz9dDzSOf81f4AvQf1i3+DPmayByDkvZrOwVJ/jr
         ys3AH4CvMaRd3+J3QaauW9ztr6s6Coy7i7ZOoK4at2AgJIe3fLE9qn6OyNaN7tkcvypW
         dk+g==
X-Forwarded-Encrypted: i=1; AJvYcCVjJxyhv7LZ4gmUaPZeCyvtWe9MVV7pLqwXM9bVfI7kDfwqeRo5ASB3LVlXFztfVm3ok+HwoKuonuwXmGkhfr9mQw==@vger.kernel.org, AJvYcCX7SfgEE45FTE7OfNPzemp3xLeMwayrdsivZXqZC7lT10JBkyh+BmZGCsvJGw9oVTIirGz5Ogk271E=@vger.kernel.org
X-Gm-Message-State: AOJu0YwAhInF06IiweSiuKrQva6DjPmiv9sG+PkB5fL6zwiKibCLy2Hc
	ZsBfCoG9DDicVlOjKoPVKjpnwrOwAbuQUF4hF+lj0f3jgh2vf110m7s01dBQYpI=
X-Google-Smtp-Source: AGHT+IHaB6ViN4QHdzLFqmTOTFKSMiMiZtRTOSRTRG9TEbA3KF71yyDWqGQxkN0wUL7cKGTqlA8xww==
X-Received: by 2002:a05:6808:1595:b0:3e6:27f1:d756 with SMTP id 5614622812f47-3e758c40173mr10838931b6e.2.1730767683069;
        Mon, 04 Nov 2024 16:48:03 -0800 (PST)
Received: from anishs-Air.attlocal.net ([2600:1700:3bdc:8c10:d414:4f86:7740:65e1])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-3e661190d07sm2317994b6e.11.2024.11.04.16.47.59
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 04 Nov 2024 16:48:01 -0800 (PST)
From: anish kumar <yesanishhere@gmail.com>
To: andersson@kernel.org,
	mathieu.poirier@linaro.org,
	corbet@lwn.net
Cc: linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-remoteproc@vger.kernel.org,
	anish kumar <yesanishhere@gmail.com>
Subject: [PATCH 2/3] Documentation: remoteproc: add overview section
Date: Mon,  4 Nov 2024 16:47:48 -0800
Message-Id: <20241105004749.83424-3-yesanishhere@gmail.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
In-Reply-To: <20241105004749.83424-1-yesanishhere@gmail.com>
References: <20241105004749.83424-1-yesanishhere@gmail.com>
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

