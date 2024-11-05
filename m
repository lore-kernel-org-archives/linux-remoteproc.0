Received: from mail-oi1-f171.google.com (mail-oi1-f171.google.com [209.85.167.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0945E2868B;
	Tue,  5 Nov 2024 00:48:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730767689; cv=none; b=KOuFpVZxARSMaEBBcLuWySUhjHpXY0qSZNvGSOWcfiV5x0WjxjCv1JSaLbJ+fmRh599Qd6pQdxRWcz2Z1smZL5lhRv85qyrrcFQdZbIMAk+A+yTbeexOnR6x8xr8hPj3AeD1SbD4Atq8A9EwuL/aLcAe3AjHnfeLC0HzINQahf8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730767689; c=relaxed/simple;
	bh=q/I54BCN7FOH7agzrRrVPUjzTgm2RIcPaI9LKCRWP5s=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=oIoexRzJrjcUFQLWbgGyxzZFOA8cCJQXb5FwThc8r7GyuoIZ30zFrYqMbPwPoo1uXcFGCHFv3wz63vvhJgcb6zx3JanxSQyEXvREG3C+vVRE2H7shMs6x4b7Hmn7sBxdb9xVpsU8HZh2mjRwV5+neti1iT6qe8ABaYwmXldgvKk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VZ3vKAAD; arc=none smtp.client-ip=209.85.167.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VZ3vKAAD"
Received: by mail-oi1-f171.google.com with SMTP id 5614622812f47-3e6105886dfso2877820b6e.0;
        Mon, 04 Nov 2024 16:48:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730767687; x=1731372487; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VMFHpngG6qydjgLEjOI9ZIqyN4Q1VIumJ5ShzygmB4U=;
        b=VZ3vKAAD765AiJ84voIM9I34CoRng2kOuU/a7qA+xdwkoseGa4lQMo5zJH98TpnYRd
         0YQA1TD4oHjSKCNCM0LWdMy2zPGg+XvMzKcsk6xHM2S0R2aIKhtkkoDrNOabj6Il8Cjw
         CJ1Qebxt/AHnd3c5V00A++dz/3nKkoHvAHyuED2MtCnhFcILzSS3jRq5Ux+rH7WruDy/
         4mrBoYC9QzKhLc7chN57doBpUUrb2bBYjaLcbIKLaBsJX1hhqziC6grHXCMGpiiADCGv
         IEQ5YfFgOVgIS3G4IRd8+6DA3VsHpTCpTuIIqz9PJS/PeJZXaZDhN2B2Gd5two/pNy1C
         fHEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730767687; x=1731372487;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VMFHpngG6qydjgLEjOI9ZIqyN4Q1VIumJ5ShzygmB4U=;
        b=Y0FagJQYd6mLIl1NtR3yNCJ111JkLuOdl1Nn2Q5FqjP7W2IBcpaMflBmKRYS02UyOx
         wQ7zv8YuVUHB3E1jDBxxtCh2hoI0dcgAL9KOlxiMyAxVhO8PXNKMNUQlbp8OfKvGleKq
         mYk8AntotNv/n36cqWxfOuXqiMwj8KO4rJUFVZrT7t4ndzNHimBEL/QNC1cNMa5wvCuG
         Oyaz1Nc1SMa/4HrHH6rHrIoOlnvbV7Bo0Uj7U5ATMai0uyg2p/kFo6WdcqFVMXfv8EDW
         TEMCQwn9kmwKesTEXEi7UgGRSD/qtDl2okpoLEXI+BiOvHoHFSRieO0YRPAhW0yO/l8A
         402g==
X-Forwarded-Encrypted: i=1; AJvYcCU5YQ9G0292M3Y5Php7JvpZ5yTK8/lMCKAUUtsnjvMC9dWH3R+Ysi9sT8oGKz/DCxs7w4N3NAuwvab7cuqC3fLwrQ==@vger.kernel.org, AJvYcCXwAuTM3HQXyZUYSGoIztnTHAhqDDkFwgz81Mz89/yxkseOuzxDG6A0RFt0KZ6d+D1C0xUSlI63d8k=@vger.kernel.org
X-Gm-Message-State: AOJu0YzIEGQM++r3HTaY2BF2Bs+VW8dnHG+bB8bDf+SiIXwavZteTAV9
	ZIpFhttZxIj19/l9CmdHYX4lENUmof0TFcP0fyNSaU1NItbkeOfT
X-Google-Smtp-Source: AGHT+IF1k9cPVBQXV2vIuKk4ABDveD4Y3gCJ2K5GjcYjMlhsmx2nEJJBH4u+5VDn0/ag7gkTr223CA==
X-Received: by 2002:a05:6808:1892:b0:3e6:59b1:8acd with SMTP id 5614622812f47-3e74c3d97f6mr7729940b6e.15.1730767687024;
        Mon, 04 Nov 2024 16:48:07 -0800 (PST)
Received: from anishs-Air.attlocal.net ([2600:1700:3bdc:8c10:d414:4f86:7740:65e1])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-3e661190d07sm2317994b6e.11.2024.11.04.16.48.03
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 04 Nov 2024 16:48:05 -0800 (PST)
From: anish kumar <yesanishhere@gmail.com>
To: andersson@kernel.org,
	mathieu.poirier@linaro.org,
	corbet@lwn.net
Cc: linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-remoteproc@vger.kernel.org,
	anish kumar <yesanishhere@gmail.com>
Subject: [PATCH 3/3] Documentation: remoteproc: add a note to rproc_add
Date: Mon,  4 Nov 2024 16:47:49 -0800
Message-Id: <20241105004749.83424-4-yesanishhere@gmail.com>
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

Added a note to the rproc_add description regarding
the availability of the resource-managed variant of the API.

Signed-off-by: anish kumar <yesanishhere@gmail.com>
---
 Documentation/staging/remoteproc.rst | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/staging/remoteproc.rst b/Documentation/staging/remoteproc.rst
index e0bf68ceade8..658ef7a28dd2 100644
--- a/Documentation/staging/remoteproc.rst
+++ b/Documentation/staging/remoteproc.rst
@@ -223,6 +223,14 @@ If found, those virtio devices will be created and added, so as a result
 of registering this remote processor, additional virtio drivers might get
 probed.
 
+.. note::
+
+  there is a resource managed version of this api called devm_rproc_add.
+  Most of the times, you should use that unless you need to explicitly
+  control the rproc registration with the core. If you are using devm
+  variant of this api, then rproc_del will automatically get called when
+  driver is unloaded.
+
 ::
 
   int rproc_del(struct rproc *rproc)
-- 
2.39.3 (Apple Git-146)

