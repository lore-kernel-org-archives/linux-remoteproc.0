Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00548341661
	for <linux-remoteproc@vger.kernel.org>; Wed, 22 Oct 2025 12:04:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761134647; cv=none; b=RdvRm736aLeLY9s98IVaU9eItJBP6hfGcBHup43GF3mm3y1hXO31k6SuuT+gRvF0f4kd+AVQl3YS6NBRlm6TR0bJwUtP8GyBMmY1rqfcbzz59qYdl6SItX8/kpOFS6pxclSsNIqHqoxNiCb0siYBBAWaPro3RsTxtV60gae6zcQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761134647; c=relaxed/simple;
	bh=as1/iJCKjb7SOP9XJnrfJxwDG6kNXSlSXRFXgB8yG2A=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=PELljg13+FIYTT2azotv/louG09UPWh+eA4lrXrxw3OL+q6QMWOa+W5RapWw+3GLdHoqKOtOEIhYtd05SJFqfRnViXWLYUJE5WorkQyp35tqxo1fM0yD4+54DZwpu+7DrTQfGdGmVbFVOp+genY4eTjs21LoClT/2t50WLFfF7k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=CnAs0fuj; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="CnAs0fuj"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-471075c0a18so71356205e9.1
        for <linux-remoteproc@vger.kernel.org>; Wed, 22 Oct 2025 05:04:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761134643; x=1761739443; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=y/uG6ohwNHaAW4/+V5Ld55scjKuHgXP+xVHH2DHe0D8=;
        b=CnAs0fujszPew34LdjQA4/niWBK2XogUR5FDmmJpYrvdww3MFGBVoa6Z3RSzHs/iYa
         wlA+w65HbYGQWKXjMRzYbgmULuq4GpbttuU8ZKKWvW5aUTRbkESWhIQZvcqfCTtNWgtZ
         dyKCArTbpkK1GnwbQoRue+iwQDFhgwGGqbqFDX/uKRikZcZVljPxaCvJVUcup2YAMlyX
         bESeNH0tsvMN3cztO86p2b2PGZLV6CRMU3qPC9A959NOA23o+v0e/UNYdFDrq5pW0FDh
         cGaiNDaoEwuWU4k4dbQVQ0noCxr2NUAknpqFnW8uwtiEGqYmcxrmF7VLARIA5wby6Qe8
         ax0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761134643; x=1761739443;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=y/uG6ohwNHaAW4/+V5Ld55scjKuHgXP+xVHH2DHe0D8=;
        b=HXMzqWdewTWncrJHb9oVCwRd6RCYvGpQQ9NtNYSYFayygRGA8V5ZpIp5SE8q/rOvRk
         HrVAOzvSAg14YEpvZhMlgqU+9jg32GkeucKfRO9Lgpau1t3314ZXj8ZxZn4vlBU8aHNO
         jot2YvLOTe/N4qZhIPF4c7C3YkXB+QFw7OBXNrp6XpHYLzsxac28nw2lKlImY48ThW1d
         /w5kY7KAvKLky1jThR5wuph7D06HMXradeiFQHAD2bdEq9Ag2cNmop1Mrd4Ou4kVAu4O
         hyOiQIRsd2BaaS+XwcOf6xnS1brZlx/pHNXewfP2uF3Aq87bu7RfjssU4zsJV4fuiQLc
         1Jag==
X-Gm-Message-State: AOJu0YwK0qOIwq1Cywb0rH1MocUx3y6Hzj9ZomAFFK6zLeTYBLBVmToy
	3Emc6hZOJTdc71Gb58PX2STJYMFa6TMA2XWKkek38XlR39XAlMIFh4w9mkxtnL5MrFQ=
X-Gm-Gg: ASbGncvDM/QtB8qc5oYNMjqwWcCj5Ntru0c9660Mks2ZqzZOiXOtzTogzoMt3UvLTYC
	4b1E1xVhlhiFOVQc9nhy1n+NDuCtNjWRcRSn+c+v0u4Z+WulUYpIaBI9GrgGeojiV8Kf/Af6G3y
	eluxdp51A1k3i0DDd6NPR6YZyehoi2efDaWjS0wCr2R9lJipDzJEWT2jXjyVpJs9zXjxsKN6mpR
	mRekSM1hVtIDgyf1ixCgZLdfA+CrkeS2DxXpL3N7x05FWekA9hc40Xv2Sx4n/PvFKwEROuSlIb8
	lwyGKRaFsUJgj6hdG1PNxvv9uXw7NK0IdkPjgYcDkrZ2K+zx7HCVfKTTs5nGkpHgpz/TaAeZ/7a
	JM32INIUx5/jWbugDibbunMBgTmefPXypSr8v6pkafrdnrWOCazdJ4onFspA1vCZIaa2L9xdeVJ
	RcbNlbZnQL4wkUMHnU
X-Google-Smtp-Source: AGHT+IHMBDXpGpbEfpc5hp07GqRBz5Zc/h4bucY6Xo4Kp6RS7bfrBnMAUVRfoR0fepcnzXgAucRbFg==
X-Received: by 2002:a05:600c:3f08:b0:471:11a3:a6a9 with SMTP id 5b1f17b1804b1-4711791f738mr166115145e9.37.1761134643232;
        Wed, 22 Oct 2025 05:04:03 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-475c4342368sm41445045e9.9.2025.10.22.05.04.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Oct 2025 05:04:02 -0700 (PDT)
Date: Wed, 22 Oct 2025 14:05:36 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Dawei Li <dawei.li@linux.dev>
Cc: linux-remoteproc@vger.kernel.org
Subject: [bug report] rpmsg: char: Implement eptdev based on anonymous inode
Message-ID: <aPi6gPZE2_ztOjIW@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello Dawei Li,

Commit 2410558f5f11 ("rpmsg: char: Implement eptdev based on
anonymous inode") from Oct 15, 2025 (linux-next), leads to the
following Smatch static checker warning:

	drivers/rpmsg/rpmsg_char.c:548 rpmsg_anonymous_eptdev_create()
	error: dereferencing freed memory 'eptdev' (line 546)

drivers/rpmsg/rpmsg_char.c
    538         /* Anonymous inode only supports these file flags */
    539         if (flags & ~(O_ACCMODE | O_NONBLOCK | O_CLOEXEC))
    540                 return -EINVAL;
    541 
    542         eptdev = rpmsg_eptdev_alloc(rpdev, parent, false);
    543         if (IS_ERR(eptdev))
    544                 return PTR_ERR(eptdev);
    545 
    546         ret =  rpmsg_eptdev_add(eptdev, chinfo, false);
    547         if (ret) {
--> 548                 dev_err(&eptdev->dev, "failed to add %s\n", eptdev->chinfo.name);
                                 ^^^^^^                             ^^^^^^
The rpmsg_eptdev_add() function frees "eptdev" on error.

    549                 return ret;
    550         }
    551 
    552         fd = anon_inode_getfd("rpmsg-eptdev", &rpmsg_anonymous_eptdev_fops, eptdev, flags);
    553         if (fd < 0) {
    554                 put_device(&eptdev->dev);
    555                 return fd;
    556         }
    557 
    558         mutex_lock(&eptdev->ept_lock);
    559         ret = __rpmsg_eptdev_open(eptdev);

Should we free eptdev if __rpmsg_eptdev_open() fails?

    560         mutex_unlock(&eptdev->ept_lock);
    561 
    562         if (!ret)
    563                 *pfd = fd;
    564 
    565         return ret;
    566 }

regards,
dan carpenter
