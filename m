Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 466F834D936
	for <linux-remoteproc@vger.kernel.org>; Wed, 22 Oct 2025 16:41:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761151320; cv=none; b=rEfy0qPCy7fnVr3v2wnwCRHyyHooIwckCF0Zgp0IDE7lTiG5TQdsfTFgUd+otzGBpE3a0FvriLmOGFJeF5cXn5ZCEELHvNRAdDBjVMGJoLAkpY/pXV29AkzAstaRV1KOhkblb31Dfhfhgxfe/jZwY/tP4T2r6LsAI6AOj3lZ+4E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761151320; c=relaxed/simple;
	bh=2vWmFk4y5TbRSs+4vak9zGVVFLugZeVA4qWb78DLA08=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=U+wnDTNrc4klZ6NVJkvx3NcYJay7cYmbODAg+Lxe/tT9yZN7Inmhhy6agKxEey8EiPfVPB0c93bbG+7rbNo0dEbW96J7k8LcCFm/OXdnRgZQqcldu+ETHjjG++46llEFfR4LvZudvbXwtNWIPSZyTQ2z0vUOOvf1BGclmZloffo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=q7JjMnb+; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="q7JjMnb+"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-63c12ff0c5eso2800786a12.0
        for <linux-remoteproc@vger.kernel.org>; Wed, 22 Oct 2025 09:41:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761151316; x=1761756116; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=nHeAINtRqbrBeIt4fn2btFVrE3mtnl1Lx9MqTNrSkD8=;
        b=q7JjMnb+34yJlYuLhYg3wTwLe0Y4faDMytUG6nKqHRrenDMvRVA4ttHNAXslol+qOl
         D/SpEHHIFmO23SUbY6X7ztjNWF7yz1PfY3wlWLE6vCt4PneHp77Mlp3Sy6kOaO5oECqZ
         nBgwLLaJWJczndFoTBGHW4nNe7YyXLw7gIIksOg2J+U4I7MhpHKCGCeKkvU2ZcVrz3UT
         TsUjg5fWeXs1eUHdHeqoCSmwiDnm/BEiT1lsHsy6/ChL8A6ajb8vkfL9F6JIEbhmHY21
         PseQblUrZFsg6PTMj2OTaS1pycyLeNIuFq0wSNh0Yt3M27PP5WW+bGvkCH6VOo9u+dAM
         uMqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761151316; x=1761756116;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nHeAINtRqbrBeIt4fn2btFVrE3mtnl1Lx9MqTNrSkD8=;
        b=FRMWxXoLEIcScBmTpCdI0fvX7VF62zpElw4VJnWXrGWWEZOr6v4/zw4HN3m8tiiIvC
         GSjZ95Gw9OO8qmfexyaQNsVVkZJLSG04WBIcD0XruoSMZ+f+b/Q4bMIljiK03gw90QvW
         7Jx6n7pSvw9NcCANahTjKQ98jITZGMY5jbCuVlNLFybxzhXnoJf06pbV7aFA+z8XrsSs
         c132t++CyZUQzWn0vOvBdH1rNAdyR2IVIX4qYgV1WXVWsuj+u+JT9FgglIJNHz9ZFJyL
         m0xuxvjcBX9tHLf7IUNr29+VSHkV6TWJuSI++S60prmMv4S9HIOffQkxhjM+4x5FYe4l
         5bwQ==
X-Forwarded-Encrypted: i=1; AJvYcCUuxmThzA3Rwikwgo3jWryJvT/KOigb13UO3/ikalRGOFxUz7fv2L1746yheI1hWDiI0hSWVCI6Mhlyg9TBtUM9@vger.kernel.org
X-Gm-Message-State: AOJu0YzmTyLT7Rx9ERbvENSIwDY+dCosKKduitO5laHv0Lwer3ufD5bS
	ITi79l9BQpXon090m1rCWjq1ZOiahd5BniBRZBqdtnaAr0f/36nrBCEE9JEyv3Zxrdfcp78X21x
	MHtzUpVgvRkaR/lI1mY7e+hDq15thP0qLd9RiQ02Zhg==
X-Gm-Gg: ASbGnctgEuhVz5+4MS38Sd5fdowTa9eetCtmDu9HiM/hobnKg3X31cZ9++QmGneZXpk
	DGsDZxZBAmNiMXBd9rEMl33GYlnfbKQ9zM1G7/l2fJcJr5YOCRCq9O8n/o6qITmYuuaMcNyL4Cx
	haiWVE6lW6g0aEa2QYR/Kk6/ud8uijvxexTLqhbCRM/0RdN9UnrRJjrPWmEgd0aIwvB1+RSCocM
	oq12g+Ci/eM8+b3jSfGIhBPp5FDMhr/sXVVi7+7cjz4Xp7ndyyo+W/x2enZ0i9DRTSG1VAWXnXf
	uncIjC/vSorvwL08GCk=
X-Google-Smtp-Source: AGHT+IGukuo4NtoRhOjouLLgJHSpIXAEZzeWnlukkfPJv1wLn/DtL0EkbAOhqzVKnadePB1Tt7h7DjBicPbKuhLjAmw=
X-Received: by 2002:a50:fa8d:0:b0:62f:1366:46e8 with SMTP id
 4fb4d7f45d1cf-63e2707a0acmr1750004a12.7.1761151316544; Wed, 22 Oct 2025
 09:41:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <aPi6gPZE2_ztOjIW@stanley.mountain> <20251022155351.GA59635@wendao-VirtualBox>
In-Reply-To: <20251022155351.GA59635@wendao-VirtualBox>
From: Mathieu Poirier <mathieu.poirier@linaro.org>
Date: Wed, 22 Oct 2025 10:41:45 -0600
X-Gm-Features: AS18NWDYanTsYPvQAYQz_rHeLa5gqZB1yKc6rYCZ8RphSqs_ATFR_9rIVHpBrv0
Message-ID: <CANLsYkzQ9qFWw5MAaWt20WdmUdNweoPvX7rspp7WZxnvM96V7Q@mail.gmail.com>
Subject: Re: [bug report] rpmsg: char: Implement eptdev based on anonymous inode
To: Dawei Li <dawei.li@linux.dev>
Cc: Dan Carpenter <dan.carpenter@linaro.org>, linux-remoteproc@vger.kernel.org, 
	andersson@kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 22 Oct 2025 at 09:54, Dawei Li <dawei.li@linux.dev> wrote:
>
> Hi Dan,
>
> Thanks for the report.
>
> On Wed, Oct 22, 2025 at 02:05:36PM +0300, Dan Carpenter wrote:
> > Hello Dawei Li,
> >
> > Commit 2410558f5f11 ("rpmsg: char: Implement eptdev based on
> > anonymous inode") from Oct 15, 2025 (linux-next), leads to the
> > following Smatch static checker warning:
> >
> >       drivers/rpmsg/rpmsg_char.c:548 rpmsg_anonymous_eptdev_create()
> >       error: dereferencing freed memory 'eptdev' (line 546)
> >
> > drivers/rpmsg/rpmsg_char.c
> >     538         /* Anonymous inode only supports these file flags */
> >     539         if (flags & ~(O_ACCMODE | O_NONBLOCK | O_CLOEXEC))
> >     540                 return -EINVAL;
> >     541
> >     542         eptdev = rpmsg_eptdev_alloc(rpdev, parent, false);
> >     543         if (IS_ERR(eptdev))
> >     544                 return PTR_ERR(eptdev);
> >     545
> >     546         ret =  rpmsg_eptdev_add(eptdev, chinfo, false);
> >     547         if (ret) {
> > --> 548                 dev_err(&eptdev->dev, "failed to add %s\n", eptdev->chinfo.name);
> >                                  ^^^^^^                             ^^^^^^
> > The rpmsg_eptdev_add() function frees "eptdev" on error.
> >
> >     549                 return ret;
> >     550         }
> >     551
> >     552         fd = anon_inode_getfd("rpmsg-eptdev", &rpmsg_anonymous_eptdev_fops, eptdev, flags);
> >     553         if (fd < 0) {
> >     554                 put_device(&eptdev->dev);
> >     555                 return fd;
> >     556         }
> >     557
> >     558         mutex_lock(&eptdev->ept_lock);
> >     559         ret = __rpmsg_eptdev_open(eptdev);
> >
> > Should we free eptdev if __rpmsg_eptdev_open() fails?
> >
> >     560         mutex_unlock(&eptdev->ept_lock);
> >     561
> >     562         if (!ret)
> >     563                 *pfd = fd;
> >     564
> >     565         return ret;
> >     566 }
> >
> > regards,
> > dan carpenter
>
> Diff below should do the trick.
>
> diff --git a/drivers/rpmsg/rpmsg_char.c b/drivers/rpmsg/rpmsg_char.c
> index 34b35ea74aab..c322df56394f 100644
> --- a/drivers/rpmsg/rpmsg_char.c
> +++ b/drivers/rpmsg/rpmsg_char.c
> @@ -494,6 +494,7 @@ static int rpmsg_eptdev_add(struct rpmsg_eptdev *eptdev,
>         if (cdev)
>                 ida_free(&rpmsg_minor_ida, MINOR(dev->devt));
>  free_eptdev:
> +       dev_err(&eptdev->dev, "failed to add %s\n", eptdev->chinfo.name);
>         put_device(dev);
>         kfree(eptdev);
>
> @@ -545,7 +546,6 @@ int rpmsg_anonymous_eptdev_create(struct rpmsg_device *rpdev, struct device *par
>
>         ret =  rpmsg_eptdev_add(eptdev, chinfo, false);
>         if (ret) {
> -               dev_err(&eptdev->dev, "failed to add %s\n", eptdev->chinfo.name);
>                 return ret;
>         }
>
> @@ -561,6 +561,8 @@ int rpmsg_anonymous_eptdev_create(struct rpmsg_device *rpdev, struct device *par
>
>         if (!ret)
>                 *pfd = fd;
> +       else
> +               put_device(&eptdev->dev);
>
>         return ret;
>  }
>
> Mathieu, Bjorn,
>
> What do you expect me to do about it?
> 1. Send an independent fix patch.
> 2. Squash the fix patch into previous ones and resend series again.
> 3. Wait for other (if any) bug reports and fix them in a whole.
>
> I am fine with all of them.
>

Please send another patch I can apply on top.

> Thanks,
>
>         Dawei
>
