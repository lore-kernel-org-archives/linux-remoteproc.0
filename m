Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22C30282EB
	for <linux-remoteproc@vger.kernel.org>; Tue, 11 Nov 2025 16:41:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762879304; cv=none; b=pyQimPy+w37Y+4TnJabdH2zApH0bpBjd7yasWYQGRpACtiHL6vrhtucsvD1+ZF7OJzxCkemlsWnu4O7M6Cri1gDQDI94mP4rOLsFvkvlkHPTmEhsCLzlH74GRIfUGYsDWOCp30fezO/ecDmuc09FolzVxdIwtdSrkgMVNoHLmzU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762879304; c=relaxed/simple;
	bh=ChcHSDTqsYqn2Zx8uIHdTpg+jru+SMukJEqD3tfssjY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nIe0KDjWCuadN3aTrEt0bJXnao6acB8ISTlDVLWzNfrDB+W3iSHIV8Gdc5gW7fOesvUE+4YuIegGVl1jA/6ad8yXD/0ZkscijiCwq8vbBpwcEfXeRFaXRC+L7+lPMGc0ARrgRpGQcCNGWGLmVxvtJZ53lrtHTmQJeIQpXmu9n5E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=EMTjU9A/; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="EMTjU9A/"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-7b6dd81e2d4so594330b3a.0
        for <linux-remoteproc@vger.kernel.org>; Tue, 11 Nov 2025 08:41:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762879302; x=1763484102; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=z8hKaS69p4GeSJZhbCy1MYHdxSYxTlq/NjqEf/qu8ts=;
        b=EMTjU9A/P/GwG1I25cv/rUTQWcEBvPLbeQ+Uoc8PK0bM6ymbQu5LsE9nTDgLeHxrlh
         O0l/9kH1bt/1Am8Ol0G0FaxXz5GNE8GBw6dHN9HIrDiybACNkBWFU+QHCI5MS/Gv6Ae3
         1Z4aQRnk+NV/4Hz7vHxRvYsgUxTDcguGCpIga/rlZIxgYgFj3bUmPkRyNUT9FqktvBeD
         UTNg7pnUB88W9vnIdujIZW0C2rCiBIN9NWWdN9MoEur25VJl45ZUZuGXd+2zW5HYgR2a
         cNSO/5KejJCbsqNfUrTACMvVBagQHrU+DFDsVWF9nDXzZtXi6uXuw9ZnrjDII8emwMd7
         yJzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762879302; x=1763484102;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=z8hKaS69p4GeSJZhbCy1MYHdxSYxTlq/NjqEf/qu8ts=;
        b=HYEMan+DsL463FgjS/aoLgA8ikuPdeV13qNN4uRr62lDVgIDVivaRQ29g780ytC4FU
         UqCLexPqqtdydq4QHehkaQzuz+m/Mg7uh5bzzx06kqyb61RaN9sumiBw98Tdmc1iWI5X
         qe78tFJ7DJRL+EQw+WmMepzRWnB0tQJWIdX3o9iIO+sK9Us7CoP6aeKK9ZCiCGjXR37V
         JYx4p2mSjAZPzIYGhcL9tRYWn7PYt4+OeTdAfAGHQp9qUuyXhzw5kXlESrB4uxYZgSC6
         phVmeeXtkr00sVmJ45yhZG5aUqE0JP6F+K/nJ+WA9yKaIvHscH1ecOCjdQmbWWZL+zTa
         UWDw==
X-Forwarded-Encrypted: i=1; AJvYcCXbqjKE6qafWcMDdZQTaEeIdCcL4C2pcUUJUjtzyf0aypUoxO+oxC4fQMeJP2tRqzEmjdQ2mHLVMU35/thFVpXf@vger.kernel.org
X-Gm-Message-State: AOJu0Yyn2k4r5csjMy9RtSe5Y/wwfuprCVEqCuo8JyrolEpm/HaaOzbr
	rXel6Y9A4uHCaDPYYW9gbTfoohL8OriZIbBZ2wBvQuCxhsEB87BmDDhskesjpSAfhQc=
X-Gm-Gg: ASbGncuEbcDlL+aqfdLigL+XIhEAQtIwkUjyI9u19HyfuGl4PAw99lpOVBW89uZNDDt
	h5Q1cmV18TeLcdFKVNh5LFW+IxldcH4199dCqFfZuRm8DNFxgUqc+5qzrThLW12mlRN1LiwuuwY
	OCZ1Q1b3m7AOIuOhOZ0TWhquXKFXfbF/qf514yyG4z5rmoCdfWFx2Fy1egnEMxdL/FWIG34rV8E
	Wctwa2P3sNWQ9JQogS4uPrp1aL87lC6oCMIOUhqKGU/IoYnDAex9M/iFvP4JWnCT8ZRm/bta1WS
	YMAfwTXS/fq/nbCvt2TvpTbREd9MRRYCHF/LBe1gQ/8oHMjv9jD3EsEMjeeFEmb86JhwaHevccU
	1vc1XQmtlHqNvi1Bi7jyfSgwTpEnomQ4rIf4nTDWdVjYrCkIFHzzc8uut+OC8pP/M7mAg/ceHFt
	MbSJV+4nv60/X6pQ==
X-Google-Smtp-Source: AGHT+IEq4ZkRBiCSqPNUaRCAOsnMhG4XmMEBUynM5LxwDWw1Dd2xG06WPW9d4T8wmdC2kS8n1BlW1Q==
X-Received: by 2002:a05:6a00:13a2:b0:77c:6621:6168 with SMTP id d2e1a72fcca58-7b22717b64emr15501971b3a.30.1762879302375;
        Tue, 11 Nov 2025 08:41:42 -0800 (PST)
Received: from p14s ([2604:3d09:148c:c800:9bac:aef4:ae3b:80be])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7b0ccc59eb6sm15848435b3a.67.2025.11.11.08.41.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Nov 2025 08:41:41 -0800 (PST)
Date: Tue, 11 Nov 2025 09:41:39 -0700
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Dawei Li <dawei.li@linux.dev>
Cc: Dan Carpenter <dan.carpenter@linaro.org>,
	linux-remoteproc@vger.kernel.org, andersson@kernel.org
Subject: Re: [bug report] rpmsg: char: Implement eptdev based on anonymous
 inode
Message-ID: <aRNnQ9qowlvilXeB@p14s>
References: <aPi6gPZE2_ztOjIW@stanley.mountain>
 <20251022155351.GA59635@wendao-VirtualBox>
 <CANLsYkzQ9qFWw5MAaWt20WdmUdNweoPvX7rspp7WZxnvM96V7Q@mail.gmail.com>
 <CANLsYkxTqz3QnuO3MEJoDx=ad43YbUNKiU_xtEzfiV+XAaGbdA@mail.gmail.com>
 <20251111125302.GA183476@wendao-VirtualBox>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251111125302.GA183476@wendao-VirtualBox>

On Tue, Nov 11, 2025 at 08:53:02PM +0800, Dawei Li wrote:
> Hi Mathieu, 
> 
> On Mon, Nov 10, 2025 at 10:05:44AM -0700, Mathieu Poirier wrote:
> > On Wed, 22 Oct 2025 at 10:41, Mathieu Poirier
> > <mathieu.poirier@linaro.org> wrote:
> > >
> > > On Wed, 22 Oct 2025 at 09:54, Dawei Li <dawei.li@linux.dev> wrote:
> 
> [...]
> 
> > > > >     546         ret =  rpmsg_eptdev_add(eptdev, chinfo, false);
> > > > >     547         if (ret) {
> > > > > --> 548                 dev_err(&eptdev->dev, "failed to add %s\n", eptdev->chinfo.name);
> > > > >                                  ^^^^^^                             ^^^^^^
> > > > > The rpmsg_eptdev_add() function frees "eptdev" on error.
> > > > >
> > > > >     549                 return ret;
> > > > >     550         }
> 
> [...]
> 
> > > > >     558         mutex_lock(&eptdev->ept_lock);
> > > > >     559         ret = __rpmsg_eptdev_open(eptdev);
> > > > >
> > > > > Should we free eptdev if __rpmsg_eptdev_open() fails?
> > > > >
> > > > >     560         mutex_unlock(&eptdev->ept_lock);
> 
> > > >
> > > > Diff below should do the trick.
> > > >
> > > > diff --git a/drivers/rpmsg/rpmsg_char.c b/drivers/rpmsg/rpmsg_char.c
> > > > index 34b35ea74aab..c322df56394f 100644
> > > > --- a/drivers/rpmsg/rpmsg_char.c
> > > > +++ b/drivers/rpmsg/rpmsg_char.c
> > > > @@ -494,6 +494,7 @@ static int rpmsg_eptdev_add(struct rpmsg_eptdev *eptdev,
> > > >         if (cdev)
> > > >                 ida_free(&rpmsg_minor_ida, MINOR(dev->devt));
> > > >  free_eptdev:
> > > > +       dev_err(&eptdev->dev, "failed to add %s\n", eptdev->chinfo.name);
> > > >         put_device(dev);
> > > >         kfree(eptdev);
> > > >
> > > > @@ -545,7 +546,6 @@ int rpmsg_anonymous_eptdev_create(struct rpmsg_device *rpdev, struct device *par
> > > >
> > > >         ret =  rpmsg_eptdev_add(eptdev, chinfo, false);
> > > >         if (ret) {
> > > > -               dev_err(&eptdev->dev, "failed to add %s\n", eptdev->chinfo.name);
> > > >                 return ret;
> > > >         }
> > > >
> > > > @@ -561,6 +561,8 @@ int rpmsg_anonymous_eptdev_create(struct rpmsg_device *rpdev, struct device *par
> > > >
> > > >         if (!ret)
> > > >                 *pfd = fd;
> > > > +       else
> > > > +               put_device(&eptdev->dev);
> > > >
> > > >         return ret;
> > > >  }
> > > >
> 
> [...]
> 
> > >
> > > Please send another patch I can apply on top.
> > 
> > I haven't received a fix for this yet.  After looking into this bug
> 
> Sorry about the late response.

We are at rc5.  If issues with this feature aren't addressed by rc7, it will be
taken out.

> 
> > report with more scrutiny I am of the opinion that @eptdev should be
> > free'd in rpmsg_anonymous_eptdev_create() where it was allocated.
> 
> Yes, and it's exactly what diff above is doing.

The error path of rpmsg_eptdev_add() should not call put_device() and kfree(),
this is something that belongs to the error handling of an rpmsg_eptdev_add()
failure in rpmsg_anonymous_eptdev_create().

I'm also wondering why the two "if (cdev)" conditions in rpmsg_eptdev_add()
can't be merged together in the bottom one.

> 
> > Furthermore, if function anon_inode_getfd() in
> > rpmsg_anonymous_eptdev_create() fails, function
> > rpmsg_eptdev_release_device() will be called but I don't see a call to
> > cdev_device_del() in there.  Am I missing something?
> 
> 1. rpmsg_anonymous_eptdev_create() does _not_ create cdev, so it's not
>    supposed to call cdev_device_del().

You are correct.

>    https://git.kernel.org/pub/scm/linux/kernel/git/remoteproc/linux.git/tree/drivers/rpmsg/rpmsg_char.c?h=rpmsg-next#n546
> 
> 2. So I assume you mean "what about epdev based on chardev?". It's
>    simply because cdev cleanup job is on rpmsg_chrdev_eptdev_destroy(),
>    _not_ rpmsg_eptdev_release_device().
> 
> So my proposed fix patch still holds, IIUC:
> 
> Author: Dawei Li <dawei.li@linux.dev>
> Date:   Sun Oct 26 23:18:06 2025 +0800
> 
>     rpmsg: char: Fix UAF and memory leak
> 
>     Potential UAF and memory leak exsit in exception handling paths for
>     rpmsg_anonymous_eptdev_create(), fix them.
> 
>     Fixes: 2410558f5f11 ("rpmsg: char: Implement eptdev based on anonymous inode")
>     Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
>     Closes: https://lore.kernel.org/all/aPi6gPZE2_ztOjIW@stanley.mountain/
>     Signed-off-by: Dawei Li <dawei.li@linux.dev>
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
> I will send the fix patch if you find it not offending.

Offending?  What would I be offended about?

> 
> Thanks,
> 
> 	Dawei
