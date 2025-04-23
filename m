Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B72128BA91
	for <linux-remoteproc@vger.kernel.org>; Wed, 23 Apr 2025 17:22:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745428932; cv=none; b=C0DhiC8pG5udoxrZ8nehAjoT4faSNDDRhNtpiZbOljNCQxJuHQH13x8Few6gzwJMiNoPwnjq4S6HfdvlAFjui3R7VxzJDEbc514+dIs6WYNDd0v6Ppw2QzVcWwSRA14nqwxRles86Ul3MQ2zlNV29hBPH91grd7jc/Pl4YvGxcY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745428932; c=relaxed/simple;
	bh=oJSYqGkH8eJ7nnI4eONslaNCAK4zDKV2Mf6cPlywreQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=dcTo0M1cH1sSz2GyzT2QVNaD2FDY6rCA1pFtF47Bam6RSDj4EhTU2Tl0DL43M78es5U3PajVaO1db2QcuIOm6rJcOD7dslcTrAOK8u4uDMSz2716n5muK/EiSqbBZJTtypry3xtsuyHvD8bZ19hAE59Xj9dy4F9gSeUWuCLpHYQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=PIsTen+t; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="PIsTen+t"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-39d83782ef6so959557f8f.0
        for <linux-remoteproc@vger.kernel.org>; Wed, 23 Apr 2025 10:22:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745428928; x=1746033728; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=I/fWatsoyC3ISeEvWnCn+x63EPNqLu0aQi3bXvQHx9s=;
        b=PIsTen+txJ4y14/TzBIiwRaPQhjL1Zx7srnlszJHjVqrqoKe6tLh23V9tXqmqwAVRo
         7wEO3Vmo8s28ddYy9Ypyap4toFXwh/GUYi8/LOXySKfHS38D+4kGvEwhLks/LmtHT5ln
         orS+xQg2/vhfolUbGfDwoSmMuNtf0HNlH42P8h+BtfjE8c9FCHMaNXs0iedaq8VNM0N8
         xMrapZFwNbFHuxIU9PWus5fWm/CQyIY8oFLGwgqb9ckR3+3z1AnDFcztUPi8OU7ESN5D
         jrDw6efb0GulF2VEsgAn9kNv6cIk3etFBwxRzW3u8LwJYToDTrSyxUf9RF7V4SgefNFI
         gOaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745428928; x=1746033728;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=I/fWatsoyC3ISeEvWnCn+x63EPNqLu0aQi3bXvQHx9s=;
        b=wBIjtgjehf2/OhbzztcSImhKLfy9PxQlqa7dqz3dN18HIVoekXezrkJXvj1v1xtaLy
         Owr7g8P60znl1bcmazEw/veoTdy5uy5NCVyFW7e/R76ZVkE+dZOpQg0wcpbiB2F2M5rQ
         gQ0foVaajdlXMvkiTDuc2I7gChC9i3o/hfQfz4owsmojaYIrVD1iL1nWIupTMAy8fmVi
         4B9L4W1cmCYQVds8xltRyw8PwtNP2nOb9tCS87KtK/xmUkNYLE8+f6JKeU/KOXMuVazm
         DnL+5k1cw+Lqtnbm/GuPzj7MTpLrTg1tHmhswxtE7/jgTJjMCejDXdAYgz8v5yg7jK74
         W7tg==
X-Forwarded-Encrypted: i=1; AJvYcCXu3aF6qadGLjMBosoKMTp+e7Q7peIfMDXsqsFWMBoVvlK8yhpw6DDIhxJgtEgJA7jgPU05WS3NCq6sWd58/FL/@vger.kernel.org
X-Gm-Message-State: AOJu0YxC5lL5pk1qJj93zmo1agfti+FcGgDWbleF/qVjQQFMtjaBFXR6
	jFDQB83hl2m1qUxgv2/OaQy6G8R9mKdH0CeGUD1uXOinbAgw9Idf5goqxpt+ff4=
X-Gm-Gg: ASbGncu7fF0witbUDW9HBpEaUz97g9fPbo/3Oi5OdsLJnpal8g0Y76HXjPEwF5HZWvD
	pF9doHlzZuwPC8FtZHwOOnonQC41K7wNFDDh2l02vTB1TSR1FPuQhvWyhlz0bqrmVQMlXPEOuTU
	K00bSvPSH/Ew6jCpb4c37qOl2skddiBHxeZhxjokSCPHyUDR8RznIIMj97qr2Ld0jiJDlaJY0bo
	fDCdxVU1VZkxOOj5FZj0JhwC06lKbXRCpAec6FamaNgREE9Zxrm8DFM0sgmfgNabNLLIlq+MMnC
	+OZkbbokX++lbs7s23Ol7B5hgEKfVrFnJE2qIYkCNS0viQ==
X-Google-Smtp-Source: AGHT+IHpb3M2AX8ubADr1y8Clnmgy74dWjubTc/OZ082AsTXoWv1+RFKxrQiRpJTvsF1zuzQls4pfQ==
X-Received: by 2002:a05:6000:1acf:b0:39a:c9ae:9eea with SMTP id ffacd0b85a97d-3a06c6bd8cemr18787f8f.10.1745428928559;
        Wed, 23 Apr 2025 10:22:08 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-39efa493115sm19460396f8f.78.2025.04.23.10.22.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Apr 2025 10:22:08 -0700 (PDT)
Date: Wed, 23 Apr 2025 20:22:05 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>,
	Naresh Kamboju <naresh.kamboju@linaro.org>
Cc: Mathieu Poirier <mathieu.poirier@linaro.org>,
	linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	stable@vger.kernel.org, patches@lists.linux.dev,
	torvalds@linux-foundation.org, akpm@linux-foundation.org,
	linux@roeck-us.net, shuah@kernel.org, patches@kernelci.org,
	lkft-triage@lists.linaro.org, pavel@denx.de, jonathanh@nvidia.com,
	f.fainelli@gmail.com, sudipm.mukherjee@gmail.com,
	srw@sladewatkins.net, rwarsow@gmx.de, conor@kernel.org,
	hargar@microsoft.com, broonie@kernel.org,
	Arnd Bergmann <arnd@arndb.de>, Liam Girdwood <lgirdwood@gmail.com>,
	Frieder Schrempf <frieder.schrempf@kontron.de>,
	Marek Vasut <marex@denx.de>,
	Anders Roxell <anders.roxell@linaro.org>
Subject: [PATCH] rpmsg: qcom_smd: Fix uninitialized return variable in
 __qcom_smd_send()
Message-ID: <aAkhvV0nSbrsef1P@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CA+G9fYs+z4-aCriaGHnrU=5A14cQskg=TMxzQ5MKxvjq_zCX6g@mail.gmail.com>
X-Mailer: git-send-email haha only kidding

The "ret" variable isn't initialized if we don't enter the loop.  For
example,  if "channel->state" is not SMD_CHANNEL_OPENED.

Fixes: 33e3820dda88 ("rpmsg: smd: Use spinlock in tx path")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
Naresh, could you test this patch and see if it fixes the boot
problems you saw?

 drivers/rpmsg/qcom_smd.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/rpmsg/qcom_smd.c b/drivers/rpmsg/qcom_smd.c
index 40d386809d6b..bb161def3175 100644
--- a/drivers/rpmsg/qcom_smd.c
+++ b/drivers/rpmsg/qcom_smd.c
@@ -746,7 +746,7 @@ static int __qcom_smd_send(struct qcom_smd_channel *channel, const void *data,
 	__le32 hdr[5] = { cpu_to_le32(len), };
 	int tlen = sizeof(hdr) + len;
 	unsigned long flags;
-	int ret;
+	int ret = 0;
 
 	/* Word aligned channels only accept word size aligned data */
 	if (channel->info_word && len % 4)
-- 
2.47.2

