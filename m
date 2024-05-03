Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABA833FE37
	for <linux-remoteproc@vger.kernel.org>; Fri,  3 May 2024 15:24:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714749882; cv=none; b=ABtJZesaI+ELKS6IptIoTeOasMRis67ksspYz3Ca8IPnr1xRiy43dYfjfXNmUf6CkX4Iz2q8d6ZjLDrGSynyCdcttUsaGkW9aULvQwe+LTWyZWNHb0KPjWf80ZhgAtHbE8ULBcTo0vbCGoOUVf3tD9UXevzRTNLZg8gRr1WqeoU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714749882; c=relaxed/simple;
	bh=Uac/FUn37kYJiTj3+3eBuJx4wQRJhxVsZESCh5jz+Sk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jhK0/MsYoVlWgVNQHxHfibSBA3DopcaZqSjqp7nR80eVOjQfdkb8v3bpY23TaRvimxKD9I6r4N3CebxrsepJ8v2AxWhAz1FfihA1KL0SGAWjoGzfavp9jQM3Kt2BYtIcDjCAtQJ5IdFoRHpVkh0WqAmrIK4OhM9zi5U8R+UcVu8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=d8njDZN5; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="d8njDZN5"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-41b7a26326eso59779935e9.3
        for <linux-remoteproc@vger.kernel.org>; Fri, 03 May 2024 08:24:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1714749879; x=1715354679; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=s59P6lQRKvJHxlKc8sBnVFoR8nz1tZLE0JKp+NjMBa0=;
        b=d8njDZN5U7fI28vmZo3cXvHo/4qTMVialaN/JkKQ5CnKYgDcEwOREWziEw6jcR7oYI
         0uOYRpf5iFzz8Leinzz/hBevvzRhpMgDI/10fkkWSI8/zMYsON2keNHJ302+oMh/8R0K
         StNRtVZ82SvAZvmfC4GjRyuvoUpST2ggRqDufVyv021LOnMxeCsqXPQ9E+byotHxXVOU
         Ws28JfGXPD1ORPOq+JblA/HywRI3va5Q0hsPZXYm0HJBDyM/7aQrD9xZqJNf85TZykh8
         R9QrkbBhFYJ/EIyTgHvVw8nnYm4zs8KCtjxNPSe4ECkXQ6Nn+b7ILpI2yXaw4W0PDyNn
         D3eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714749879; x=1715354679;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=s59P6lQRKvJHxlKc8sBnVFoR8nz1tZLE0JKp+NjMBa0=;
        b=bbhG2JNsjyFrDw3EyWEU+0/RNaoFOwMgfECdRFyeoD3sc5FYXNBplH+TA6CzN9Ansy
         DKgNvITL35zpLOuI8WdsHLRVz9dOjvJdmOi/WM4BNrO9JM++KMeWGUnMUz+tQWCgNFPZ
         W246WOOx173Ytk0WjqxBUMOCsQrzR/C1zhHuMKsmMvFxRJ4WMFHF9aJH0mChMwXOqATN
         I8ZOHjMYQFDlzS1eTxTxCyCj2NP3U3wqs/N7fEuiLWg81eELu8lZLpRJ6kKBbcBQEpn5
         c2ZXSrlHSncN7oBk0aR2mbmejwwL+3mTUtEk6BwOiEtuFFQLlc4y+CWkACyuc8Rf9g7X
         pttw==
X-Gm-Message-State: AOJu0YxIY9Z37ikNABVCT+OjptR6m6fHLmGgNsliYDEwQA0YzPXLFpCZ
	MAEcdpmU7+q6skODKj73YKgrzOYZj9PbDM0BT6iCB2HCI+oWw8+YyYmPNHCNTOcZNL1iIjBTWCZ
	7
X-Google-Smtp-Source: AGHT+IG5HCUNYAYU2RLHXkoIseXUa+DJKVVMKtjmSeMgE/T2Y+oW1P460XNZhSq01efz9vFQeFmJmQ==
X-Received: by 2002:a05:600c:1395:b0:415:4b4b:1e28 with SMTP id u21-20020a05600c139500b004154b4b1e28mr2306876wmf.20.1714749878856;
        Fri, 03 May 2024 08:24:38 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id je8-20020a05600c1f8800b0041bf28aa11dsm5943014wmb.42.2024.05.03.08.24.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 May 2024 08:24:38 -0700 (PDT)
Date: Fri, 3 May 2024 18:24:35 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: b-padhi@ti.com
Cc: linux-remoteproc@vger.kernel.org
Subject: [bug report] remoteproc: k3-r5: Do not allow core1 to power up
 before core0 via sysfs
Message-ID: <acc4f7a0-3bb5-4842-95a5-fb3c3fc8554b@moroto.mountain>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello Beleswar Padhi,

Commit 3c8a9066d584 ("remoteproc: k3-r5: Do not allow core1 to power
up before core0 via sysfs") from Apr 30, 2024 (linux-next), leads to
the following Smatch static checker warning:

drivers/remoteproc/ti_k3_r5_remoteproc.c:583 k3_r5_rproc_start()
warn: missing unwind goto?

drivers/remoteproc/ti_k3_r5_remoteproc.c:651 k3_r5_rproc_stop()
warn: missing unwind goto?

drivers/remoteproc/ti_k3_r5_remoteproc.c
    546 static int k3_r5_rproc_start(struct rproc *rproc)
    547 {
    548         struct k3_r5_rproc *kproc = rproc->priv;
    549         struct k3_r5_cluster *cluster = kproc->cluster;
    550         struct device *dev = kproc->dev;
    551         struct k3_r5_core *core0, *core;
    552         u32 boot_addr;
    553         int ret;
    554 
    555         ret = k3_r5_rproc_request_mbox(rproc);
                      ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

    556         if (ret)
    557                 return ret;
    558 
    559         boot_addr = rproc->bootaddr;
    560         /* TODO: add boot_addr sanity checking */
    561         dev_dbg(dev, "booting R5F core using boot addr = 0x%x\n", boot_addr);
    562 
    563         /* boot vector need not be programmed for Core1 in LockStep mode */
    564         core = kproc->core;
    565         ret = ti_sci_proc_set_config(core->tsp, boot_addr, 0, 0);
    566         if (ret)
    567                 goto put_mbox;
    568 
    569         /* unhalt/run all applicable cores */
    570         if (cluster->mode == CLUSTER_MODE_LOCKSTEP) {
    571                 list_for_each_entry_reverse(core, &cluster->cores, elem) {
    572                         ret = k3_r5_core_run(core);
    573                         if (ret)
    574                                 goto unroll_core_run;
    575                 }
    576         } else {
    577                 /* do not allow core 1 to start before core 0 */
    578                 core0 = list_first_entry(&cluster->cores, struct k3_r5_core,
    579                                          elem);
    580                 if (core != core0 && core0->rproc->state == RPROC_OFFLINE) {
    581                         dev_err(dev, "%s: can not start core 1 before core 0\n",
    582                                 __func__);
--> 583                         return -EPERM;

Is there no clean up on this error path?  I think we need to do a
goto put_mbox at least.

    584                 }
    585 
    586                 ret = k3_r5_core_run(core);
    587                 if (ret)
    588                         goto put_mbox;
    589         }
    590 
    591         return 0;
    592 
    593 unroll_core_run:
    594         list_for_each_entry_continue(core, &cluster->cores, elem) {
    595                 if (k3_r5_core_halt(core))
    596                         dev_warn(core->dev, "core halt back failed\n");
    597         }
    598 put_mbox:
    599         mbox_free_channel(kproc->mbox);
    600         return ret;
    601 }

regards,
dan carpenter
