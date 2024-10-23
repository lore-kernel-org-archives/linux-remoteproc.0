Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE87C14A4D4;
	Wed, 23 Oct 2024 05:34:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729661656; cv=none; b=jisO7tFJAy3sQBJKHeX/dcDt8rNzrD9nmvlBa2j3dN5CRaHbEBIMOz7K4lbgVto37K2Tq1bAHa4pN1ZnyaNnbdlP9Bxlyx0WTGkMdd5H/Yxnna5GzMEXO+9JINkeA/aR8b4mauOyjeYBi1HSehei32ysrCG7ujR0onAZaHqH0lI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729661656; c=relaxed/simple;
	bh=H08U5oWZUJNTY30DSm31TfVn5UwgrqSEj7at2YqMbM4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=tLtsek0Jb0LfPWgu5yopC0f+FuOiqVE3jFjD4q9Tkh9D2egGitKjlJX/OwT/A/29PkoZOKVEGZJ7l37zMWsYDyAqASOuioV90Tr+j3Psg9vXSFESQA7cyoHRH5GDBX5meWfyKJQMvVvuAhyIhTUCtLD2jsi6PUYGKGBvOkU2Ves=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QcLoQ8W/; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QcLoQ8W/"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-71eb1d0e3c2so2964998b3a.2;
        Tue, 22 Oct 2024 22:34:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729661654; x=1730266454; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/wVoklxOBqW21xTyhDYcC8JN3gnOiU9+L5vGfbyRiSg=;
        b=QcLoQ8W/VxYiAWIBXj/DXsPGDQXKmeRY4Nl4yEaIkMFtmP2do0OEQPALTQxv8sq6ce
         W9HHNDP28C5MuDfzK6i/eTyUrRm1X5ZvL3uQfyfM51WSIDMiGGi1excfEL3P9am9XnV/
         P+xFkiY6xA5B1fZYXPG1dg9+ihsiRUIWqU/b9RVTMP48kb+kvb61Bfwhy9tEce8rA9qr
         InTYrmBwz8uDalwz+xguOedr/AXWDjo5g7BTff5PDXPqQNowktzupwA9xzqJcAlCPpxG
         /5BsYKAf3WaHroyRhawrT9kFPlsLXIw4uqfoFwyJuPWeK5Y9TJhNY1IVjgZSmtBAxSxh
         VTDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729661654; x=1730266454;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/wVoklxOBqW21xTyhDYcC8JN3gnOiU9+L5vGfbyRiSg=;
        b=UQAWEGLoT0ErOYaMo18HUiVDzoEgNHJa3gACZwZ3CdkRbTDvh1GfP2LQjhXaKSS4oN
         LVZZuFxoJS2Aldkjzabttl+c5HultG5J5H9pGP4cDJyjLulmJBVKYQjf7LwnRRZYrzZD
         rB0pN7mdoYS4MJNXggFEmyIl4CARJcNz3q0md9SUM4H5oZar/7yTi8tQE25mjV6Yv4mU
         fJ/Y6Y5ReQzbcKraal9vWzP/BNIJR4qgj5fBe82003kNJ27ICO+rc0r/HT1AZN609cR7
         qaVQK9AFTUR66S3oes3nVQKdMJot3FfQJghDeKYrXQF72r2GmlqHUemBZd/5w5y+NzVC
         Jkxg==
X-Forwarded-Encrypted: i=1; AJvYcCUEuBCxD4tyhvEkfnGjaBQKrptM+OpI9zzavIO2sAXuh8bBUz713WPn2gCzC3abMlTRSLjUUXxg2hs=@vger.kernel.org, AJvYcCWJmBYIp5OgvS0gVA4c7HpgvQMXJUap6vNyoC4LynvcmIT126cx2UvNQ4k8rqdFun9cLq/hPa43NSiUAZuK@vger.kernel.org
X-Gm-Message-State: AOJu0YwjlRwMcyH+RU8VtWIJlSPqdllL5elF+/+QB5/aaEqT4B1eH3JA
	FMgpOLBIytDaw2Mj9rDy9qnGW58oWrhhg2cSLiPNs3Yj3nvla0Bm8lkyBoWI
X-Google-Smtp-Source: AGHT+IGacROSmH/+O42SAkylik2rWf6UAyq1kifRT6Ue1e3+6d9SLf7AmlXEP58plectNdXSlew63g==
X-Received: by 2002:a05:6a21:3942:b0:1d9:2bed:c7d8 with SMTP id adf61e73a8af0-1d978bd541cmr1775484637.43.1729661654191;
        Tue, 22 Oct 2024 22:34:14 -0700 (PDT)
Received: from anishs-Air.attlocal.net ([2600:1700:3bdc:8c10:1c93:3e9d:2c84:d5f9])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e76e0877a6sm428695a91.54.2024.10.22.22.34.12
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 22 Oct 2024 22:34:13 -0700 (PDT)
From: anish kumar <yesanishhere@gmail.com>
To: ohad@wizery.com,
	bjorn.andersson@linaro.org,
	mathieu.poirier@linaro.org,
	corbet@lwn.net
Cc: linux-remoteproc@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	anish kumar <yesanishhere@gmail.com>
Subject: [PATCH V4 6/7] MAINTAINERS: remoteproc documentation path update
Date: Tue, 22 Oct 2024 22:33:56 -0700
Message-Id: <20241023053357.5261-7-yesanishhere@gmail.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
In-Reply-To: <20241023053357.5261-1-yesanishhere@gmail.com>
References: <20241023053357.5261-1-yesanishhere@gmail.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

As remoteproc documentation moved from staging,
update the same in this file.

Signed-off-by: anish kumar <yesanishhere@gmail.com>
---
 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index eeb4c70b3d5b..1fa39bee6ab7 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -15907,7 +15907,7 @@ S:	Maintained
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/andersson/remoteproc.git rproc-next
 F:	Documentation/ABI/testing/sysfs-class-remoteproc
 F:	Documentation/devicetree/bindings/remoteproc/
-F:	Documentation/staging/remoteproc.rst
+F:	Documentation/driver-api/remoteproc/
 F:	drivers/remoteproc/
 F:	include/linux/remoteproc.h
 F:	include/linux/remoteproc/
-- 
2.39.3 (Apple Git-146)

