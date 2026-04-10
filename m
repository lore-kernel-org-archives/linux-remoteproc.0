Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7DAE3815DF
	for <linux-remoteproc@vger.kernel.org>; Fri, 10 Apr 2026 10:14:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775816078; cv=none; b=HGdThN/Tqpm+sxXP34kHD8YCsNy3HL/83+VwMmYO6CEsOMggdzSAe300WQ8uUs7IKT3G4hsaJEjcEzVOldazMCMncC80PS7AlVxOSSvYo1HwsicAzh18rdYS5Ofqjs7XfkuxAw1YfabFOHbCJX61xOytYSpTxRbXQbrKhxDqqyU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775816078; c=relaxed/simple;
	bh=fTaJGFGSA+8XkjKmDYYkL5PWmxO55ra1LeF7ee6w5dw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=oQxQ4LMXifTF4SCmLd03pf6SRzdhjKnXcEFEm3+OOsIcBJhRNgtWumS4aVuHlnhr8XF1bKJyZZmRl5YyhnM/Z3ANSzcDihXOspqBFWhJ9jfYfaEiNVdM+CpwQIVNW+lUV9c/I+Lcmv3bFK6JsXUHvWype+2U+qiYXgop8qjvSeA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hr4ttCGG; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hr4ttCGG"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-48374014a77so25507445e9.3
        for <linux-remoteproc@vger.kernel.org>; Fri, 10 Apr 2026 03:14:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775816075; x=1776420875; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uL9GWwJ9kLzsZ5NBcpCezKS4+Ld86kMdx9P0geaGeSE=;
        b=hr4ttCGGUDtnXVlsxckmxkyzfMLMaqO5rpTzLFO2ljX5rZLCYmFGpN5nBQHXLO7xFL
         Wwfwa5vgbqDZsPZkCXvEdMOarDA6VnLsl6IWhF4DGVvW26TpDuLRgh7Rwtf+jngaOlet
         1dAyU/c9B9j7v4jPnEDaNrisPsxbEQihsbHTBy4iyHR1GUmQMgyOJwyvP6PUePh/b8bs
         8stQ4rM21A8C9HhDAH5KDgaevH/2a1Pn4lK0GJjFgIgJREn1KO5H+HuA1kdkpfKpdqDT
         RZHW7G2DyDEpMAxSnlssgtJ+FT9fHbiuwDw/CJFmd8eoEfZzuG7fQs7/4VuBm3xM5Ram
         OD8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775816075; x=1776420875;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uL9GWwJ9kLzsZ5NBcpCezKS4+Ld86kMdx9P0geaGeSE=;
        b=CBvSfbqY2ai9TMWVi5R3MvVGFiT6ELNcxmZdic25frSgSSPo5h3171rUg3Sdg5K+BS
         H0/LPUQugmT2kFwUagYh1TgCnsBZP0hV34B1W4twgTGpBcygzBD+VhHAlnwJj52OE+8C
         HLbOmExJW4IvHEXthsS1jsXKLBiQQaeqH75c0qVV6MzLCG2jbK5+igQ0t8nYsq9eYW+T
         BmEmSaTDjiUm26CEvYt+2gGBRMH5jb+T+X4HDT7F8BSUrPFX8wyHh5gpdOMYuYFvJJ+G
         oTeJOpiZ/63WfCbGMiaFafUEKGaw70vgG5x9o9Wi0gLdmqmZSZOEL6A++MRhTk/TlaYR
         vk1Q==
X-Gm-Message-State: AOJu0Yzlbt8c1nKMWnXGj40URvxCfBeJouzEd0OkxrG8gzJ4Ifk7DR1G
	MYn4t92YKDOKhBgwsGG57vN8WCH9f18PVBKSd+JextOmP7d2LQhufaC707F5EF9V
X-Gm-Gg: AeBDievD3ytTeGaVr03RgluapYZ6o0vdMIHjgQks9KBx4p/0sB5G8vIbiam+GiSfSyZ
	nzSqFvDNeSpCwdtuXBvcWM/P+oo8evALWOeR9cPmTIhn/yTKbig9yGewmmAQUXNkf5+7NW7WtmO
	4h9COGwR+6MyZaXGHH+uuHMsbWI6dZxAbJX8YRADEvrngionIUtYRAncYZN/90o+FvpYgoJL0ER
	do3Q56e83XCV9C2C4t1pOADSs2fz0C9mD7h6FGzhQdGElrPsRsUG+ciHUTt0hxzoqbzunSa7Cuo
	zO8Svfwccl88KOHZ01Clf0OczmecKA6wTTgjxlhXXSLeYJq1qocE5Oqn55L+t37lURvlYCXS363
	jrGJnGa6303cZW+c72uFQAuNz6351V/tSlHDSjyCiCKdtrpWxpYVp3dHmmvmspfa8KpNhDszk4d
	BlTcL4cDiLTstqU9Qr98k=
X-Received: by 2002:a05:6000:2c0c:b0:43d:2ffc:2f6c with SMTP id ffacd0b85a97d-43d6427b958mr4043838f8f.5.1775816075245;
        Fri, 10 Apr 2026 03:14:35 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d63de2a74sm6753642f8f.3.2026.04.10.03.14.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Apr 2026 03:14:34 -0700 (PDT)
Date: Fri, 10 Apr 2026 13:14:31 +0300
From: Dan Carpenter <error27@gmail.com>
To: Rob Herring <robh@kernel.org>
Cc: linux-remoteproc@vger.kernel.org
Subject: [bug report] remoteproc: qcom_wcnss: Fix reserved region mapping
 failure
Message-ID: <adjNh-PeNtl8tAtj@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello Rob Herring (Arm),

Commit f9b888599418 ("remoteproc: qcom_wcnss: Fix reserved region
mapping failure") from Jan 28, 2026 (linux-next), leads to the
following Smatch static checker warning:

	drivers/remoteproc/qcom_wcnss.c:541 wcnss_alloc_memory_region()
	warn: 'wcnss->mem_region' is not an error pointer

drivers/remoteproc/qcom_wcnss.c
    527 static int wcnss_alloc_memory_region(struct qcom_wcnss *wcnss)
    528 {
    529         struct resource res;
    530         int ret;
    531 
    532         ret = of_reserved_mem_region_to_resource(wcnss->dev->of_node, 0, &res);
    533         if (ret) {
    534                 dev_err(wcnss->dev, "unable to resolve memory-region\n");
    535                 return ret;
    536         }
    537 
    538         wcnss->mem_phys = wcnss->mem_reloc = res.start;
    539         wcnss->mem_size = resource_size(&res);
    540         wcnss->mem_region = devm_ioremap_wc(wcnss->dev, wcnss->mem_phys, wcnss->mem_size);
--> 541         if (IS_ERR(wcnss->mem_region)) {
                    ^^^^^^^^^^^^^^^^^^^^^^^^
We changed from devm_ioremap_resource_wc() to devm_ioremap_wc() so the
error handling needs to be change back to a NULL check.

    542                 dev_err(wcnss->dev, "unable to map memory region: %pR\n", &res);
    543                 return PTR_ERR(wcnss->mem_region);
    544         }
    545 
    546         return 0;
    547 }

This email is a free service from the Smatch-CI project [smatch.sf.net].

regards,
dan carpenter
