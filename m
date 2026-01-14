Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E3FB3A89BA
	for <linux-remoteproc@vger.kernel.org>; Wed, 14 Jan 2026 22:42:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768430554; cv=none; b=ErsFtrbhx+QrM+aNir2DG3o27zaovIdeSVCDn+T9mz03Hd3PqqsBMgdai9/b8GDrTKDPXBR72MhkVg/Zt1D9nV3z+3aR1ghcjQ0ZYCDsUW2zTjZV6tLIaV+TdTps3j7FVMmi1zILx9R5WbiCG1Gun4z/3LrVPBPpGMPZk9apxNo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768430554; c=relaxed/simple;
	bh=FsoC5ZXVIM0tPvsgw+kQrOtyl7nYAB/8v6gWuJPFCrc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=CWxVxt6GQHAXjThDc6wggE4M0KlWyQn4vsufE47mXpBVXylly5m9rpChqmHsMi7sgTmx0kMp5vzWLSE3gOIjQnJiWFNw9zcGkOQhdoxQzGCRT+eSWPP/f3O5dGmDgS9zKXv3hERUcXbAdJQnyTWTzO7YTN9nrt9D0+ig+r1wSt4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=qQj2aDH1; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="qQj2aDH1"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2a58f2e514eso2157895ad.3
        for <linux-remoteproc@vger.kernel.org>; Wed, 14 Jan 2026 14:42:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1768430544; x=1769035344; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Mq+7e6HHgulV0HLjSWXnWUAjSy0Qs9edOct4mk3Fy3A=;
        b=qQj2aDH1eXj2Uyw8N5GCdNw2JeYK+YBDNspEGd9ipUWH0Tu8L4HK+8DiJPN7+LhrYO
         nWStZAzdQuRbGK3gY39BNl8+X0OKeelc0NcqAskVB9c5xSPEaHKzLeTlbbo55WDheNJn
         2+FWDJhN+Rs98waGiSXJC6VPkp3e0uLpyrhYlP5n2AOpoiP+x5U3XaH9wb6ESdrxW44+
         hYvSbZZCpG3hiYIuwNtqtBQByvPD01455JpAXJ8klzGB7rE+K4f6AG79k/KgLOUZyszO
         VBCvH6iDI/o5pxbLh9lhaRv8mQq+dJnJ+LXsIshD4RTAhL/UArDeZnGG33bsPiPsN1Yi
         ikDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768430544; x=1769035344;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Mq+7e6HHgulV0HLjSWXnWUAjSy0Qs9edOct4mk3Fy3A=;
        b=RX2GOWc+KDPUc5JzQN8Yw4HrZuLnNtIFBZfdI/CoXvHbQ4OAjzjCc9U+q4he0dfC02
         cgYyjAPWL1Li/5lW6k+PI86Fkge6eMu/VzwQHiPBzd8VBeiwtS21SH7Sj6J/VGjTpYWK
         0jqn14QuZhPAWOrngIIpChogSG90455Hyyx5Kjjvn0u7NgJunkH30rreGJNnjxdPyV5j
         5Z8kcquk7STtB434lCayWtwLbH/zSOW9cAM8NynbIhr7vAzTPsIx1VE1tfWt8eLa8T14
         5bwp+iJBNTMajKUL0IlUHhMwFbHiNk04toEc4CcgiB3YK3DYT8a+L0edkQIYeI5iuR4f
         evog==
X-Forwarded-Encrypted: i=1; AJvYcCWSc7yDc8TzN3pBU/SRmBxnU4MEUe7owt4eHR9+OwTQE/fMfJuCiE0FxiAVH9PRMKky9/TbyRqewBftVScadw2X@vger.kernel.org
X-Gm-Message-State: AOJu0YyxomjwiAo89GfaDeYTN9+qHAHPjOwvZMr9N+e5WSVkP6idLd6b
	/QRHMUs662Jqz3Uu+/IMPc7PF92nPOEeeHvYmLWL7SGrw2+XJsuN3z9kgh7jumnNN8o3dLFcr9x
	2LM80
X-Gm-Gg: AY/fxX6/S2u+BVvR4WS2ZNqHr6/LK1AurYl/O70UrVqNg4o1nHxkPfsxf+2jU1RD620
	uDvBmN1pbSzZYcVwnzzOfnzlqNJJ+G1AFpdNIpKXg9nclDAo1nNlpLi0pbAcS1Cd29Ix7R8Fq4j
	y44CbmgDymVZ+zeosaGvzJyspACkAvqWPij+C5xRmqxRSeQB8gOGjKx+kQMFOkHn1VPgBDKD/gC
	sQJMVMBg8k6o88QdUSkIhq2rP9Y1qshhWBwZuJZfIyJOJOpj1rBfhvghCz5nvQL90PBl9nu4Zzg
	wDHaDZDu/ptt6XL7GWtPm+bq/WJ5ZWJ1OQjdRvK7Dl1MPJVl6c9Olxo1C45LRXWsVOqu1VbNRY5
	VJdWt3F2s7uBtZ05eUvG1jCCUtlQ6siB8VzphQ4ychDAWa+zMAuLacOrQfI9KFrPrwyL+yjFbsc
	uf9fZMemNuvfA8RwJzI4s=
X-Received: by 2002:a17:902:d58f:b0:29e:c2dd:85ea with SMTP id d9443c01a7336-2a599dac14emr43196155ad.11.1768430544458;
        Wed, 14 Jan 2026 14:42:24 -0800 (PST)
Received: from localhost ([71.212.208.158])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a3e3c48dc1sm232455225ad.40.2026.01.14.14.42.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jan 2026 14:42:23 -0800 (PST)
From: Kevin Hilman <khilman@baylibre.com>
To: andersson@kernel.org, Haotian Zhang <vulab@iscas.ac.cn>
Cc: baolin.wang@linux.alibaba.com, linux-omap@vger.kernel.org, 
 linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20251124104805.135-1-vulab@iscas.ac.cn>
References: <20251124104805.135-1-vulab@iscas.ac.cn>
Subject: Re: [PATCH] hwspinlock: omap: Handle devm_pm_runtime_enable()
 errors
Message-Id: <176843054363.3597156.2942719740253822601.b4-ty@baylibre.com>
Date: Wed, 14 Jan 2026 14:42:23 -0800
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-a6db3


On Mon, 24 Nov 2025 18:48:05 +0800, Haotian Zhang wrote:
> Although unlikely, devm_pm_runtime_enable() can fail due to memory
> allocations. Without proper error handling, the subsequent
> pm_runtime_resume_and_get() call may operate on incorrectly
> initialized runtime PM state.
> 
> Add error handling to check the return value of
> devm_pm_runtime_enable() and return on failure.
> 
> [...]

Applied, thanks!

[1/1] hwspinlock: omap: Handle devm_pm_runtime_enable() errors
      commit: 3bd4edd67b034f8e1f61c86e0eb098de6179e3f2

Best regards,
-- 
Kevin Hilman <khilman@baylibre.com>

