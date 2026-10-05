Received: from mail-dy2-f42.google.com (mail-dy2-f42.google.com [74.125.229.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CEFB47F76A
	for <linux-remoteproc@vger.kernel.org>; Mon,  5 Oct 2026 11:26:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791199562; cv=none; b=YF3b7vs9p56auYKR8oIPwEL1er53rFWjb5GqSSE8IdHWbT3f12B9VRQ9I2I1YZ69w3Tr9qoinelLGfjpJ93ImHyPeELwpkGJPS1sbD+oSy3ZLGBLGrQRysCvlHlbKfXtjIELBeWVkfLCo36tX36pDv68AD6bc7eNRAUiTzH6hBI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791199562; c=relaxed/simple;
	bh=8TVIQM/HaGd/JiC+xpiAj55iEZO385ENLZ0AYQUqmEw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=i8dGpiak3RtZQ5eEZfUHdedZlhLj7Y4Ie4Ii9JPJ24eD5lmnd7xdJGq2ZCo4G+Rc4dw/GiN8NDYcanfkFFlCnftMoa+EoblIViIjRMy6Kr+XSkmZK9MB6CiHXKXEvxKHfLe9TGTizK3IMepu7lDGNofXQQpHjaRSkYj3+2CvMaM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WlixzWPJ; arc=none smtp.client-ip=74.125.229.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WlixzWPJ"
Received: by mail-dy2-f42.google.com with SMTP id 5a478bee46e88-35129e4607cso932684eec.1
        for <linux-remoteproc@vger.kernel.org>; Mon, 05 Oct 2026 04:26:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791199559; x=1791804359; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=TOd6KRGzsB6SbgQdzwTvCoJ2L1EsUME1flDAt8IAtCg=;
        b=WlixzWPJUeMxlDYZYkdjupiVCYIze7I3gHqMeh/k8DwCvA+bbDwtVzBCHbrCHeDyHY
         4Ip90srpfLcF0GgCQfQ+HMwM4u26rlLsFZcvRyixIMNu+9obBwc5fwKUhWAawS9oNYRn
         +CjAng7wG54s7LZX8Fe73adWmySZIX79+/PJxiFOvmukDfAPBkPagq0mRmxHWjPNzDOc
         W4QZLWga/vDnA/7NIwhCB4IOCcUqV4ZRH3NknAVYotShCKvM21/gbhUNTaiN5Cac17dg
         FLBFABTLFYOQr4KW5tVbNmLzd/m76cdACmeCzmNCR68a5mU2wOhRzX+m5PywwehAkihw
         z9Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791199559; x=1791804359;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TOd6KRGzsB6SbgQdzwTvCoJ2L1EsUME1flDAt8IAtCg=;
        b=lBMh1Sl/Z1NqGUK7jqdPckOuJNFMv6OGpcGKQOCc8Lu5peKqzYg5yyFsiB1OQXFedJ
         S4qX0YXgMXSA2b5HIktfftk2Hz5Hjz7tD7kOaeFI18fUXGuHvP49gdIScK7Bl7tNcpmm
         c5/WE+QXad+c9YRU+htGcE7PkpkMdu7Q05sKDu2Gxp7zsGcwVgplEVRhm1LoJSYVfkZu
         Kvj804BK0gmmuv+mcmULRhdsG+wfpLLhCVKHrl1Vf9ZKjTZpGKIqFdKIZq7ip2MvJenB
         WJKwDrLlL32dq98kAgLwM1p2yXkQBhc6JIYIJ72PGg/lyAFdiEGtYNzgN4v4zpzGgfBm
         C+DA==
X-Gm-Message-State: AFuF++nDt+zULcjBdtT7970l9+9ozDJMhIjuZw/lcdg2L0CtAUKAOboL
	6Gd1z2vcY40ERXsrN7gGxof1CUcPFKiivWuju9LHtTWdZoTzSvpZHRPC+D+6dw==
X-Gm-Gg: AYBFou2LJT6LEZ5kg64wxB2i92soGFyUVR0PPo2e+yS0T5DwQWM0fbfS2HbfFdsrljc
	31dNCCvWqxeqab2VfzQfQ28GS/4rB//wx0AhCCSrVev7ixDKQRNaqrYznynCZPejw+MvThwlcyk
	Iu1NI98/+haFdIkoEFyYDTLJkGMvBm98IMWRZrVoK121n4GGSZHufY9DYk+8efT1sNdGJ0uiz+N
	I4mpfd/jEKW6ySZxtYdKyG8IGXWQ4RkQ0BiidAs78WMmVEPV3oR8SbCKs/+GmDDwHY69TADx7b6
	H+N67iIci3UkXVTYCMp3JJ3E+ko+oCc448LFxdhi4Wp6FHiH2CTabRNY1XiVVFytCBLp4FS2cTZ
	pJMW8U/ZWDjT7BCuURwsk2ukNpmXmuEA2JP6/LDkG+P89cPnWxRKzjHbLmthCuFc12eMSQG4+Je
	+d6xPvC5FY0DG2Q/+STEiN8YO8i/x4wp5YlbxcCYYc/tOCJXLhtSrdnSXgS+0lyC/kdOfZAgJFL
	EyVqA==
X-Received: by 2002:a05:7300:8a30:b0:351:1133:8780 with SMTP id 5a478bee46e88-35111338efbmr9477805eec.25.1791199558633;
        Mon, 05 Oct 2026 04:25:58 -0700 (PDT)
Received: from JMD.localdomain ([220.158.183.16])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-351277a2fb4sm14902080eec.26.2026.10.05.04.25.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 04:25:58 -0700 (PDT)
From: Atul Akella <atul.akella@gmail.com>
To: linux-remoteproc@vger.kernel.org
Cc: Atul Akella <atul.akella@gmail.com>
Subject: [PATCH 0/2] remoteproc: mtk_scp: Fix bounds checks in da_to_va callbacks
Date: Mon,  5 Oct 2026 11:25:16 +0000
Message-ID: <cover.1791198233.git.atul.akella@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

mt8183_scp_da_to_va() and mt8192_scp_da_to_va() validate the device
address and length that the ELF loader passes in from the firmware's
program headers. Both checks can be bypassed through integer truncation
or wraparound. These two patches fix them with overflow-safe comparisons.

The fixes have different origin commits, so they are split for stable
backporting.

Compile tested only (arm64 defconfig, W=1). Not tested on hardware.

Atul Akella (2):
  remoteproc: mtk_scp: Fix bounds check in mt8183_scp_da_to_va()
  remoteproc: mtk_scp: Fix bounds check in mt8192_scp_da_to_va()

 drivers/remoteproc/mtk_scp.c | 32 +++++++++++++++++---------------
 1 file changed, 17 insertions(+), 15 deletions(-)

-- 
2.43.0

