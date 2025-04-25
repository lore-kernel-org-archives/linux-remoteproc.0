Received: from mail-ua1-f48.google.com (mail-ua1-f48.google.com [209.85.222.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D768222B8BE
	for <linux-remoteproc@vger.kernel.org>; Fri, 25 Apr 2025 06:06:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745561198; cv=none; b=qLCzZNf9i95ibSq2JdGdf6Ifh+oFJCPadgyHytAAGXfsQSOKknMYKkztg+SxhR4qvP1onFnEbp0Ih8a/cRUPtk/YCsL4iA0UK+4rF5xUbtPJjyHMELldwORT3eQdT8a5ztq6oj3IBaWLymkY71jfMY8FKcZ0XObuK+pZ1ey2BnI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745561198; c=relaxed/simple;
	bh=CpBT/GJTl/qOHB8XXefQW8z5QInEFr8XQOgxoGfmDlU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BZQfzfYcSQ7J89AZvRWyRxPfPxJQnTQ2ZaIcPKrjZediXk5dDIq2AYJkNQOfpMaOllVHp6Kma0Ef1hxDgH7zcuxLpmlmM1yZTD2qWEO1vvs3RflHbdcqTJ+UWT65RP418HobW3GAA7Enl7Tv05JDHYOhUMQHB1WLRrzW0L3Ynq4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=RFtSTVxY; arc=none smtp.client-ip=209.85.222.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="RFtSTVxY"
Received: by mail-ua1-f48.google.com with SMTP id a1e0cc1a2514c-86d3ac0fec0so1797437241.1
        for <linux-remoteproc@vger.kernel.org>; Thu, 24 Apr 2025 23:06:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745561195; x=1746165995; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ajgJc89GPboKToxuB8Pj0D0uNjRPDnR6q+9b48EFZ2E=;
        b=RFtSTVxYzNOCGv2rnwTHN+3CiPKXQBATPCXeP6dr7gaQRpBhBoalnkY+LbUx0sk0K0
         uyWj5fDaidv+PnkUuO8tbvCDnuKmBCzQIZWOz1hEBc76bo18OqEBD5Oss8u10URqGgRQ
         BMs/R/kC1OEknsAsU25OZXJvGLGWnmeq+yhLXDIU5LhKz4jUdWSM0/q/rcBT1Vb5UIYp
         yibnkVOsVcZ4vQj/iAJ+eQ3TvnlV6RbQDIgst7u5CJ7Rlkd6Q4jQmnIFsYxEr9SWwjN/
         NmYo42eVBTKO60T5mAo/Q11+g3gVoJLKhg4TExj0Wq0SNGr03vP1PeV/Gv6UA8BHCwAk
         PWsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745561195; x=1746165995;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ajgJc89GPboKToxuB8Pj0D0uNjRPDnR6q+9b48EFZ2E=;
        b=CdfzeibMDr0SFIQrDOiUSDeCRxH3ziZVn+LBIGS3u/0bhNHvJBbIxnHJiOUgCXo2yY
         oXk7tVtbH8t46/q6qBnGFutDvfnwnpEKWkgiofNqQZftBIDZTtWg0oMYlLx5eFhm+s7y
         i4PgJHs7QDkU+enZKEZVE8tEeXB5RUTGeYfBrsZJ15fc7rL3j6yJGDBr+F/mRanoAJmD
         ZDMAdJuVM4RGJcl4jw6phaeNvboyf34tFz/JiIAkA1IQJitdc7M6ysCzWu4WcKS7k6Ug
         fexMsnzUmZrBr3/tGv/l7BPFQh5+kuFRczqVfAEArP+zZ4MYp8I8cyf+qcaRfUD3BKb/
         2Ulg==
X-Forwarded-Encrypted: i=1; AJvYcCUhpHKZWvRs+M/uTvZg4Xu09xGYRh/ztRn+qtc6+iZZhWivwNDor3P/ujw/C+adbA5bFOa7DDI8fbQYJn7OnJ5i@vger.kernel.org
X-Gm-Message-State: AOJu0YzixGkMN/fJFJ52liLGVgDxcltbNkByZKQBC8R8UeS3JhlAAqJj
	+weM8309588w2OqdDG/ku/47+Oxy2mjPZO9i1tidaJbg+UQS19VMIL1w6LS8D9c2BTx39z0y0Uk
	uIExgxG3bQkErym93l/swqsyMZAClorsfmHJ0Ew==
X-Gm-Gg: ASbGncsaDViDu8/ro2BbtCe5y5B+1E1w3MIC/YwCkzuKKrHkzv/cSSo1XEuuDu0lKQ0
	AVDzVtYAi1Q9FZIOf9sm6Uu1Y5WjnxeVbPeD5E/iUTiFZDlf12krLrp059xI+merC/t2QjnQneN
	C9iHEXNpTQ7OiZ3SyHI2coAu+lWYRaqbl+iCjU2RTuWZNgE6abWGOIshrP
X-Google-Smtp-Source: AGHT+IHk3Sh1recRtL0I0FAiNETtYwurKFY0CJ0FDTy8w0bAg/KMEvL/1tmqPiwb61pQkrz7JWUirq46fq8oitTFWfU=
X-Received: by 2002:a05:6102:3e87:b0:4c1:9526:a636 with SMTP id
 ada2fe7eead31-4d543fb6341mr362655137.15.1745561195672; Thu, 24 Apr 2025
 23:06:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CA+G9fYs+z4-aCriaGHnrU=5A14cQskg=TMxzQ5MKxvjq_zCX6g@mail.gmail.com>
 <aAkhvV0nSbrsef1P@stanley.mountain>
In-Reply-To: <aAkhvV0nSbrsef1P@stanley.mountain>
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Fri, 25 Apr 2025 11:36:24 +0530
X-Gm-Features: ATxdqUHyh1sPNfszHFCKsjMSGrXxYsTXLBiYXGTypFcI7J1MgDaUy852FfJYen0
Message-ID: <CA+G9fYu1GagoVWnhNFnknWf0_zk-O+5XQXDiL-XUdt8knhJYaQ@mail.gmail.com>
Subject: Re: [PATCH] rpmsg: qcom_smd: Fix uninitialized return variable in __qcom_smd_send()
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Mathieu Poirier <mathieu.poirier@linaro.org>, 
	linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, stable@vger.kernel.org, 
	patches@lists.linux.dev, torvalds@linux-foundation.org, 
	akpm@linux-foundation.org, linux@roeck-us.net, shuah@kernel.org, 
	patches@kernelci.org, lkft-triage@lists.linaro.org, pavel@denx.de, 
	jonathanh@nvidia.com, f.fainelli@gmail.com, sudipm.mukherjee@gmail.com, 
	srw@sladewatkins.net, rwarsow@gmx.de, conor@kernel.org, hargar@microsoft.com, 
	broonie@kernel.org, Arnd Bergmann <arnd@arndb.de>, Liam Girdwood <lgirdwood@gmail.com>, 
	Frieder Schrempf <frieder.schrempf@kontron.de>, Marek Vasut <marex@denx.de>, 
	Anders Roxell <anders.roxell@linaro.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, 23 Apr 2025 at 22:52, Dan Carpenter <dan.carpenter@linaro.org> wrote:
>
> The "ret" variable isn't initialized if we don't enter the loop.  For
> example,  if "channel->state" is not SMD_CHANNEL_OPENED.
>
> Fixes: 33e3820dda88 ("rpmsg: smd: Use spinlock in tx path")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> ---
> Naresh, could you test this patch and see if it fixes the boot
> problems you saw?

Dan, This patch fixes the reported problem.

Tested-by: Naresh Kamboju <naresh.kamboju@linaro.org>

Links:
 - https://lkft.validation.linaro.org/scheduler/job/8244118#L2441

>
>  drivers/rpmsg/qcom_smd.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/rpmsg/qcom_smd.c b/drivers/rpmsg/qcom_smd.c
> index 40d386809d6b..bb161def3175 100644
> --- a/drivers/rpmsg/qcom_smd.c
> +++ b/drivers/rpmsg/qcom_smd.c
> @@ -746,7 +746,7 @@ static int __qcom_smd_send(struct qcom_smd_channel *channel, const void *data,
>         __le32 hdr[5] = { cpu_to_le32(len), };
>         int tlen = sizeof(hdr) + len;
>         unsigned long flags;
> -       int ret;
> +       int ret = 0;
>
>         /* Word aligned channels only accept word size aligned data */
>         if (channel->info_word && len % 4)
> --
> 2.47.2
>
