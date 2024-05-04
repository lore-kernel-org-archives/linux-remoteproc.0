Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A3721C69E
	for <linux-remoteproc@vger.kernel.org>; Sat,  4 May 2024 11:26:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714822014; cv=none; b=NWNGqXwFoDnC8N/3LaHDoTITkpiNmZ3k8zWqcnBE2pW9KblAVOnvrS072Pl7CpPLqHPHHa95F2ekMWHx+aisSiJgB2SnLlGxW+f4Q9uZv5QZ3MztcEXpxUfu8S7Zn/mzXc98Tc6GkYPl5cVJlot5U3ko6zsb4tdjhHYbGtvRQzo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714822014; c=relaxed/simple;
	bh=ppFfFH2Xic9iAVwfgNcWsVQ85IK5kVSydtT3vRbOtKs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=mUb2JWkxmwiKRIdjBzqnluXXzTgOUaIshaaG/GQ7dP9hTZz0KzMNaZ5hgiBgsqaWon+iZIzV+elFs06vhQGd9Pv10DwFwf9ESjWcIApXL7bRtMuhzwmUD2PuTeSm7vkdbUMJasOMoW3xx5zP5idGtamCBhPlBwEMQonTMB0QhEA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=WYdEVS30; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="WYdEVS30"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-41b869326daso3447665e9.0
        for <linux-remoteproc@vger.kernel.org>; Sat, 04 May 2024 04:26:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1714822011; x=1715426811; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tV/srAsSb/6dhMxlpXH3Ch1iy2rebWL62TcHi8lGmvY=;
        b=WYdEVS30HM7KTDlgLgubFM/W4RTcrUan/ZI3d6SDmUOc77JyCzbPJFah0XqjPIEByO
         v2kfLAdcNGBQagU8an1IZo6lJvQivefab7cvA1DrT1dKDS6ZTC3qoMpaXwH+SU1embep
         C8rujm3FjRgevjqUkbivPywsKzwuPcR8a2350uNIAhbDKPGkmsyBFstVSDvui5TTds3Q
         AulbFrSgekGo7jJZEkpmUAlt2TdPWauguF2njrIpjTg5P6cmToKLKH8lbPyjzi5xk5Cj
         5Fhxwt93z2HyL1lftZHjAidBRudX8+fm75xvfN2KNMhoJ8hCtFwnTgh3fHXXZlhm0Z3z
         pfSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714822011; x=1715426811;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tV/srAsSb/6dhMxlpXH3Ch1iy2rebWL62TcHi8lGmvY=;
        b=pKEFrdK4poq/Yhyqp2p20a/omFjEJTtkQTY52JlcXWzQPJSbkS0bv1l7RAf9hRvbcc
         Sj/sHfcy3m3E0ubSMg6TR6QMootLoJTf3nvHy259tuZhy5MBRP7N3L3UmnQT2fK7/fbK
         mO4vnBOWkyN3zsXcSaKhDekbK/OndQx1ZHsMjmsYtAXWNgOkCMJGfekjqHv/OYrgJBV8
         OwgJ1vauoddLymxIat2ZDqg4YZ6m1i++f5FQv1YkAQYzivt9HnQT8ckxzE/Ao8GV0w5m
         dOM2XoNFLEXEbPBKTzRb2Tge3Dosi3YxCvofIFJQ5waYLXuSZhm2ZBwCTwNiYyjFEPqp
         +fqQ==
X-Forwarded-Encrypted: i=1; AJvYcCUO6q/50/GERAo/BSSk48bJEsJD1dTLV1qjFoEYS7oUEsdvLrVS6YvhPZPernkMytngh31/RCgqATETe06l498eFS+xrGXImGdidboEG/4PTA==
X-Gm-Message-State: AOJu0YwivIeh+IRrJflyzziLAAI3Id2rTs30OdAbrknB4isue0nWww8I
	/IXji/XAObABU2oTtW9XeDhPKhMSHlI9U6YBEABBfZY6rzkbtSkNZPK0cWAoqeY=
X-Google-Smtp-Source: AGHT+IE3ubSq/wuPsXCd+SyHjRU511lcaaoiLbDliJjNVBEkZCScLOt8UDgKVnn0wXxEtm0TJxiXFg==
X-Received: by 2002:a05:600c:4f52:b0:41b:7c07:cfeb with SMTP id m18-20020a05600c4f5200b0041b7c07cfebmr4493542wmq.40.1714822010816;
        Sat, 04 May 2024 04:26:50 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id u17-20020a05600c19d100b004186eb69a55sm8958487wmq.25.2024.05.04.04.26.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 May 2024 04:26:50 -0700 (PDT)
Date: Sat, 4 May 2024 14:26:46 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Olivia Wen <olivia.wen@mediatek.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-remoteproc@vger.kernel.org,
	linux-mediatek@lists.infradead.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] remoteproc: mediatek: Fix error code in scp_rproc_init()
Message-ID: <b2114e3c-fa64-4edb-a1ff-d2009e544c3f@moroto.mountain>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

Set the error code to ERR_PTR(-ENOMEM).  Otherwise if there is an
allocation failure it leads to a NULL dereference in the caller.

Fixes: c08a82494500 ("remoteproc: mediatek: Support setting DRAM and IPI shared buffer sizes")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/remoteproc/mtk_scp.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/remoteproc/mtk_scp.c b/drivers/remoteproc/mtk_scp.c
index e281d28242dd..b8498772dba1 100644
--- a/drivers/remoteproc/mtk_scp.c
+++ b/drivers/remoteproc/mtk_scp.c
@@ -1156,6 +1156,7 @@ static struct mtk_scp *scp_rproc_init(struct platform_device *pdev,
 	scp->share_buf = kzalloc(scp_sizes->ipi_share_buffer_size, GFP_KERNEL);
 	if (!scp->share_buf) {
 		dev_err(dev, "Failed to allocate IPI share buffer\n");
+		ret = -ENOMEM;
 		goto release_dev_mem;
 	}
 
-- 
2.43.0

