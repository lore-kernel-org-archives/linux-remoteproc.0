Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3764B1D9586
	for <linux-remoteproc@vger.kernel.org>; Tue,  8 Oct 2024 07:17:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728371840; cv=none; b=g/pl5SLdbeFkSiIOwbDMnCPa1pfxQjdMj1ceh+cJljh/cNnjdfXBYDfl8tqWGNIpIwxMf7l8SfSGl9Iw2jXhK2EGfTb23LukTAHVNzXvI4u9M5k7wkdKrcMIQ14yXaMkpFpI3EAS2I+WGzfKrMY7BsnlpV7cF3sz6fLhrEMbD2o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728371840; c=relaxed/simple;
	bh=/IbPserPXJa1bMDNzcpey2MsSiGwUivhhrPZ/JfO9dg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=keCesc0DWd6EH8Sfk3wKDzHuHBE/Q06BqZaEB18i3VrtUQ1uRM2ZviWY0XqAz98QgbqBxAyz+aA7sHz3QfWsvPIQ7VCC/3o9diWeAPxwl8P6Jx/aQmiNxenO31lHeQ5yikEFjswzLVNvblK8qyqSs7hn0ymcPrfBDMntdsMpo40=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=everestkc.com.np; spf=none smtp.mailfrom=everestkc.com.np; dkim=fail (2048-bit key) header.d=everestkc.com.np header.i=@everestkc.com.np header.b=SXUz4QNl reason="signature verification failed"; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=everestkc.com.np
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=everestkc.com.np
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=everestkc.com.np header.i=@everestkc.com.np header.b="SXUz4QNl"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-71dec1cf48fso3104314b3a.0
        for <linux-remoteproc@vger.kernel.org>; Tue, 08 Oct 2024 00:17:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=everestkc.com.np; s=everest; t=1728371836; x=1728976636; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=f01doXKW6VFqsZ9MOvvcKDX1KhWLQSKuPO/rCisrRcY=;
        b=SXUz4QNlRZv35Hg1fCJeppBfUO4GYxuADIRAtbI+p2j89whTCrVZ2qMLSj1+58DtX1
         9NTNqIt5SWi9i4+oOUlnTHvxg4pPPvKnKGkcHTppFMh6K6tMHauI2FXKvgB9GM+Jz1qp
         7L8QmwgCIX6UFPCLveMH3BP2rVBcoV1UK1Gg3t5QdzJjF04uPq2XHiEchf1P2yZLOEAg
         lGtbPQrhFl6zsDPS0d6iBvn0Zm76pOdYQ33hBNJGUaohV89OO18gf20icT6jUQKhoW68
         gF8HS8Qi49K6RFmuklsdKK7bDYAI0qhmZaCh8lQrNQV/qDAslhUYtx+hVV7MOCsi8Pij
         K98A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728371836; x=1728976636;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=f01doXKW6VFqsZ9MOvvcKDX1KhWLQSKuPO/rCisrRcY=;
        b=W8KD2yzcV+GmvwZun4h65H+DKEyLecarO2vaSRisw7n9D7s2QIcMmX9IHe2cONRF3d
         yVcDtpY2vpTjcoOamOhz/fIrKsdtz1nF15qDoaWigHFCX0ot1YfEMgL9Ffw4q/LVF8gK
         /OKhtbG3FF46wBAm7TlhfJbUWVroMvORNe+qgH8Ds/S5EpuoxEU9D07nQpAu4FQVjHlm
         I0Gq//Sd+gecI1P/QSJOzew7i+I62aLHQuwj+K9VWHcOX3J0xPoAklbQj+xN62HjsQPy
         opENKui/Nqtz/M+o2A4g+/M33+BYeL3DGP549TBe//5G5yJVQzb67NuxKZOjIsa9zx7x
         jbeA==
X-Forwarded-Encrypted: i=1; AJvYcCXU9lVqUGxKA2zyTI2l2jPbrIz4zAlHHg7WZVItT9/99a2M6Slot/3O8vf1sOGW7yXpAYUPxkFREJlkPDUoIEyV@vger.kernel.org
X-Gm-Message-State: AOJu0YygqoIANXo29brfsfmrow0KvKYyN/5SaJaeP8YQFV5sVQNv6vKx
	+VLfKcF9cCFDBdg+tbp4I+eKwP5bjICD8JcdPgAr/X6YTWLaGEfHaxHIUWMPrxZRDImsEtosef/
	HFUZtK2pF
X-Google-Smtp-Source: AGHT+IEUDv9nt+vKX0Q/pnMHLEKmwOXUvnewz9lr9/wo/hLdaw/xgTmRckwI+bGaNzPWcVxI+fAWWw==
X-Received: by 2002:a05:6a00:2289:b0:71e:117d:b12e with SMTP id d2e1a72fcca58-71e117db5demr2405190b3a.9.1728371836414;
        Tue, 08 Oct 2024 00:17:16 -0700 (PDT)
Received: from localhost.localdomain ([81.17.122.195])
        by smtp.googlemail.com with ESMTPSA id 41be03b00d2f7-7e9f682d368sm6107758a12.43.2024.10.08.00.17.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Oct 2024 00:17:15 -0700 (PDT)
From: "Everest K.C." <everestkc@everestkc.com.np>
To: andersson@kernel.org,
	mathieu.poirier@linaro.org,
	corbet@lwn.net
Cc: "Everest K.C." <everestkc@everestkc.com.np>,
	skhan@linuxfoundation.org,
	linux-remoteproc@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] remoteproc: Fix spelling error in remoteproc.rst
Date: Tue,  8 Oct 2024 01:15:57 -0600
Message-ID: <20241008071559.18523-1-everestkc@everestkc.com.np>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Following spelling error reported by codespell
was fixed:
	implementors ==> implementers

Signed-off-by: Everest K.C. <everestkc@everestkc.com.np>
---
 Documentation/staging/remoteproc.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/staging/remoteproc.rst b/Documentation/staging/remoteproc.rst
index 348ee7e508ac..5c226fa076d6 100644
--- a/Documentation/staging/remoteproc.rst
+++ b/Documentation/staging/remoteproc.rst
@@ -104,7 +104,7 @@ Typical usage
 	rproc_shutdown(my_rproc);
   }
 
-API for implementors
+API for implementers
 ====================
 
 ::
-- 
2.43.0

