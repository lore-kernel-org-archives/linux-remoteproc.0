Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A7DC145FEB;
	Wed, 23 Oct 2024 05:34:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729661657; cv=none; b=K35RyRdFh1eahei2Cg/RmspSDoYWuUdwKOmjJGrGyxSyDlt7Ni4ce2nFNLfdmj7bVau6QJf81C56LvsNzHSsxA8Y0t7SD9NmUz5gPwQAcX1gN9XO9pHbnY8PnRfUGWYQ83DuW4ih95cNxdyEzzDdJFmXtc+O9xGi2yziQD2QOCs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729661657; c=relaxed/simple;
	bh=khqAKUaBlTUcj257l5qQoN0wPr87NJmbqzaFVDfK9sQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=cfzkUq7CXvcfEKUfGtalRUz+RTFdTn1ECdiZHp7DlgF3UctlYkBynepgHW14Bqzzwo1ohBJq6UHj0irXJYDAPf0co3UpCC1d7/RtRO1RFCUWBCwY+HhDHuRK00l9LCRZFvSA8EDlQ8tatON2bFdYgbS4fQiEiLlv2l6i1YqgP/A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=F1u4qahk; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F1u4qahk"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-2e2fb304e7dso5227666a91.1;
        Tue, 22 Oct 2024 22:34:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729661656; x=1730266456; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a5VMbFcY6CEGa8mSQ8SIl+CmW5nmrRXjE9y4EUBsQZI=;
        b=F1u4qahkl2HjRqj+i6cnU2UXOAR/dSVSEC2b1eAljia3e52JIq5nMqL89o9Mhkuj5o
         HgSb7r9nXOmEESNzzPg2XqAwmiq5Taz2sDgKURPEvWqv3c3He6b8CcWQPUuj9KwzaAMM
         VO/vQIlTCyKYTlaUHJV/xK8VpKhS6lTFl2gXnYCIkMIlCV1G4WVrWOC5E8StzTMEDiXv
         FEcwvFGY5EFu38030o6VdQA4CGFqgwhrOatZf2rc8ppVgpA/+RwjmsiT3o6h6SLwomQD
         C59ghFI1FFOWVWDSh7esh7F59tBDHQZyqQY7BSsZLgz6DNJoeUm79f+Y3KCUQvOlE3qs
         YC/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729661656; x=1730266456;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=a5VMbFcY6CEGa8mSQ8SIl+CmW5nmrRXjE9y4EUBsQZI=;
        b=EEWi56oix+pPE9BUpxr5P2LVG7Sk1lK+H0oNCA7Y5yIiR05Erjs2OdvfenHs1wq189
         ymJdw+nzvMnVNI949HO+mgRvnw3CTevxr/lE/9OHSMPZ8dcdQQijLF58y038nm70ytVs
         kCoFHvFn18jpx1QrabUtF2EwJ9v23JEztNjq2DabLsR52nQvPNYUqJ2Uj++Y8exNR22E
         JbdglpmwUcJq6s/y62ELvuQ4wY2FxtaclosZamAivwbgnIvxG0MUr0BBU2ee8nmSWH1w
         orNj8Kw/Ne7zllDC/1seMjz6ZnM7ashT8CTybkPRQ4oYPse/8Izl4oP3Ty+lDObzIqFX
         pxLg==
X-Forwarded-Encrypted: i=1; AJvYcCU59tGjnJScD4wcEhQGGSgqLcPZM7eUMEjdUTyVzOspBREhyDYu8YSYEz1FjtiNcRhIQdEoGqQL/AuGIWpU@vger.kernel.org, AJvYcCX+o8QbAvEpFcSL6GpTjUo+x+4H5pJ9Y6GY1qRAOXiTBIRWLDBHeKkbRlF+FjcRI84pH9chhC00YsY=@vger.kernel.org
X-Gm-Message-State: AOJu0YzTa25GnbMXO6YD9Dzn5yAY0/ASxdfQOMGA+9oGOoUEmfS9LAuP
	8Tz698fsKqs32xW1JTXIf9F1GmoBT0jqbEaVN++eABzPlyxah04X
X-Google-Smtp-Source: AGHT+IFmpnftxB6HTXGUZIROek0Di1jrRQY9H0e03R+mkaok0KKf6SbvrWveY4qFXep/gNwiwsZuHA==
X-Received: by 2002:a17:90a:fa0b:b0:2e0:d693:7884 with SMTP id 98e67ed59e1d1-2e76b5b5900mr1660262a91.5.1729661655717;
        Tue, 22 Oct 2024 22:34:15 -0700 (PDT)
Received: from anishs-Air.attlocal.net ([2600:1700:3bdc:8c10:1c93:3e9d:2c84:d5f9])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e76e0877a6sm428695a91.54.2024.10.22.22.34.14
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 22 Oct 2024 22:34:15 -0700 (PDT)
From: anish kumar <yesanishhere@gmail.com>
To: ohad@wizery.com,
	bjorn.andersson@linaro.org,
	mathieu.poirier@linaro.org,
	corbet@lwn.net
Cc: linux-remoteproc@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	anish kumar <yesanishhere@gmail.com>
Subject: [PATCH V4 7/7] rpmsg: Documentation: update the path
Date: Tue, 22 Oct 2024 22:33:57 -0700
Message-Id: <20241023053357.5261-8-yesanishhere@gmail.com>
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

Remoteproc documentation is moved from
text file to reStructuredText file.

Signed-off-by: anish kumar <yesanishhere@gmail.com>
---
 Documentation/staging/rpmsg.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/staging/rpmsg.rst b/Documentation/staging/rpmsg.rst
index 1ce353cb232a..937cd2574584 100644
--- a/Documentation/staging/rpmsg.rst
+++ b/Documentation/staging/rpmsg.rst
@@ -5,7 +5,7 @@ Remote Processor Messaging (rpmsg) Framework
 .. note::
 
   This document describes the rpmsg bus and how to write rpmsg drivers.
-  To learn how to add rpmsg support for new platforms, check out remoteproc.txt
+  To learn how to add rpmsg support for new platforms, check out remoteproc
   (also a resident of Documentation/).
 
 Introduction
-- 
2.39.3 (Apple Git-146)

