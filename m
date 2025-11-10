Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33E332EA470
	for <linux-remoteproc@vger.kernel.org>; Mon, 10 Nov 2025 17:05:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762794360; cv=none; b=QMw+eC7N0wGq7EQ/OL62YOL5arZajUJR3eKNxHJXKq9uqUOlTr8zUR7XdWbsXv9iGImUKZ0a4h8jLngGTgIzGZ8ccItjmsDDZZFvhy2ZPdYaJiBxNmFhDs76uv9pcQg3J3LuBme/78O/sKIjb+Vqet1gZeUu1ETIhC0NqSWQ8Ks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762794360; c=relaxed/simple;
	bh=SwPfq4XVATHpg/rsIBivRM8hAbVGmSP69CnapnVBRRo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=E1ObjBme3VMUJyB48M8159tvhJn+cT00CUuYUK5ba61jDRpcMD1xyFwMFg1ed3knh5WouOfm6cdxhJBSh8M/+Z6xbuX6Vz8/6kcVEU+TeeMZ528eXOnypLnYgV1VcQ9eyCdWufM85BhZGd+cmHDMQR095Z2CGRlkr1n4wQNysz0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=kc8KlaY5; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="kc8KlaY5"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-640ace5f283so4012515a12.2
        for <linux-remoteproc@vger.kernel.org>; Mon, 10 Nov 2025 09:05:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762794356; x=1763399156; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=7nKKuy5eatvN3IlbHUDmrbG7HsD+TQPilZ2Qs0TemHM=;
        b=kc8KlaY5AUi4D1GP7x0HDZf14hudhEMVUgW9NgLnMaST4nry87kxZ7gwkiV7EmnmuA
         bHznJI8g1JEkUGwZegGcsJUSCSCIZHlaYCrg5H/5MqW8/WNDsWrc54L9LRXDzeLAb22C
         ndHQHXsCk0gRzhRBUNZt0GiRl/bNpmMUom5nhJ/Gfc5XzTdqpGKj1PYvamGNkxtXDNlU
         0V6N73Vt+kLmm4kWrI+5dBYFbGNj7gq3BE8lXbOknJpyRgfImGM+jR0JsWY5m8gkj9v/
         BWtkHGkp9YcQpzhJ99k10GDXmqWmAkW3fTKC5keKh1Cg9OY6+k8W4WEmNSPHAUfwsNtx
         JImg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762794356; x=1763399156;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7nKKuy5eatvN3IlbHUDmrbG7HsD+TQPilZ2Qs0TemHM=;
        b=vB1Q3Ndc4lO3ex1sCjjPSKtmdLn3ub8mai0P0+hWoWar4cr7ZadXLSdWpNZmWK0RZh
         z8Ce/LP45EUMazNAeq3j0o6HKA0PqKl++Rgz7NLBjR54d5gCalOSBPCeFFVvXT1VA8Dq
         M2jK55441evOCrm2PuURbLo/ZKpsdgEtJfLwj7jXNQ46DPkz0kLtI2aNS0lriJ61bwZ9
         vLcVCwkDgSJKBRGOkjNcHd15KYw6dBN/AGCmQ3+QoAmSZmImazmrhIkQ+6OJoKQbkf5k
         FhHHC3MLtuN8FoiWimwFxDd/+0LD7svskaod2560WNiJKGN1071N/dvtXKNAm+Jc1bi9
         DGTg==
X-Forwarded-Encrypted: i=1; AJvYcCXpNTajjpwpm0vF3WgJCjxQDeWnj70nKoY5jxUxkROPGyMKRSudKzKOfyx5TzNL5Xkw6MDJzSaPasWZnC8I4Kos@vger.kernel.org
X-Gm-Message-State: AOJu0YzW3gVhff9emv7/5CVgituNv7zJToFyN99d3yuwBh2TSFFz7tmQ
	lG7T0iCyBL4/COLM7khw72R1fhMNTjR6KTcQUBvj5ge6jjegr82AWC/287cHYVuTHhf4G+zDZ4r
	xdMfUGwIbyiKJ7H0tbBqUorqeMfKL2aBuYxARr+s+EYBaRzkbJ6HE0Es=
X-Gm-Gg: ASbGncvEIqiGF7YNJKZLRhw/guj3LWhvXZ3FJRJ95zxoHM9YBvcLS41NYzsxmD/6Gl7
	6Kl/eTSs7IpIhqOlrMnzC4MJoVGAB1WV7Pr9Iy9tZKmVmLn7/SiUkzg5iMPy9rmy8HmEMlijdmw
	1Yfwu1Toh30EVfvkYDVrbGT9gqSzje0qTLlEtrOOPr1QOn6/1VQSJsK3kUf7DDM9GWhFjg9UypN
	WdxDuAsVYuD9VF9HkKwvH8YOsORcWdSQS4R40eeMXBVsF4uvwAipkwhhMdJMnuD0lSaREtLoyQP
	2CdkxD2Ug935JfivmBnjEDBOgPdy
X-Google-Smtp-Source: AGHT+IGpbBMLtksrHj65H9tFeOfmCnbh9cDZ/wlQ0na+YR2kPLFhpwHiejQ1X0v8Pq3fvqF3zlshhC75nM30E8UoXWs=
X-Received: by 2002:a05:6402:4619:20b0:640:fb1f:e934 with SMTP id
 4fb4d7f45d1cf-6415e80dbd6mr6249320a12.32.1762794356419; Mon, 10 Nov 2025
 09:05:56 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <aPi6gPZE2_ztOjIW@stanley.mountain> <20251022155351.GA59635@wendao-VirtualBox>
 <CANLsYkzQ9qFWw5MAaWt20WdmUdNweoPvX7rspp7WZxnvM96V7Q@mail.gmail.com>
In-Reply-To: <CANLsYkzQ9qFWw5MAaWt20WdmUdNweoPvX7rspp7WZxnvM96V7Q@mail.gmail.com>
From: Mathieu Poirier <mathieu.poirier@linaro.org>
Date: Mon, 10 Nov 2025 10:05:44 -0700
X-Gm-Features: AWmQ_blglMMG9axl19Ge3D6CD9GCMvY_8OonWbI7FnSoglIfhXVBXRV1JHAImxo
Message-ID: <CANLsYkxTqz3QnuO3MEJoDx=ad43YbUNKiU_xtEzfiV+XAaGbdA@mail.gmail.com>
Subject: Re: [bug report] rpmsg: char: Implement eptdev based on anonymous inode
To: Dawei Li <dawei.li@linux.dev>
Cc: Dan Carpenter <dan.carpenter@linaro.org>, linux-remoteproc@vger.kernel.org, 
	andersson@kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 22 Oct 2025 at 10:41, Mathieu Poirier
<mathieu.poirier@linaro.org> wrote:
>
> On Wed, 22 Oct 2025 at 09:54, Dawei Li <dawei.li@linux.dev> wrote:
> >
> > Hi Dan,
> >
> > Thanks for the report.
> >
> > On Wed, Oct 22, 2025 at 02:05:36PM +0300, Dan Carpenter wrote:
> > > Hello Dawei Li,
> > >
> > > Commit 2410558f5f11 ("rpmsg: char: Implement eptdev based on
> > > anonymous inode") from Oct 15, 2025 (linux-next), leads to the
> > > following Smatch static checker warning:
> > >
> > >       drivers/rpmsg/rpmsg_char.c:548 rpmsg_anonymous_eptdev_create()
> > >       error: dereferencing freed memory 'eptdev' (line 546)
> > >
> > > drivers/rpmsg/rpmsg_char.c
> > >     538         /* Anonymous inode only supports these file flags */
> > >     539         if (flags & ~(O_ACCMODE | O_NONBLOCK | O_CLOEXEC))
> > >     540                 return -EINVAL;
> > >     541
> > >     542         eptdev = rpmsg_eptdev_alloc(rpdev, parent, false);
> > >     543         if (IS_ERR(eptdev))
> > >     544                 return PTR_ERR(eptdev);
> > >     545
> > >     546         ret =  rpmsg_eptdev_add(eptdev, chinfo, false);
> > >     547         if (ret) {
> > > --> 548                 dev_err(&eptdev->dev, "failed to add %s\n", eptdev->chinfo.name);
> > >                                  ^^^^^^                             ^^^^^^
> > > The rpmsg_eptdev_add() function frees "eptdev" on error.
> > >
> > >     549                 return ret;
> > >     550         }
> > >     551
> > >     552         fd = anon_inode_getfd("rpmsg-eptdev", &rpmsg_anonymous_eptdev_fops, eptdev, flags);
> > >     553         if (fd < 0) {
> > >     554                 put_device(&eptdev->dev);
> > >     555                 return fd;
> > >     556         }
> > >     557
> > >     558         mutex_lock(&eptdev->ept_lock);
> > >     559         ret = __rpmsg_eptdev_open(eptdev);
> > >
> > > Should we free eptdev if __rpmsg_eptdev_open() fails?
> > >
> > >     560         mutex_unlock(&eptdev->ept_lock);
> > >     561
> > >     562         if (!ret)
> > >     563                 *pfd = fd;
> > >     564
> > >     565         return ret;
> > >     566 }
> > >
> > > regards,
> > > dan carpenter
> >
> > Diff below should do the trick.
> >
> > diff --git a/drivers/rpmsg/rpmsg_char.c b/drivers/rpmsg/rpmsg_char.c
> > index 34b35ea74aab..c322df56394f 100644
> > --- a/drivers/rpmsg/rpmsg_char.c
> > +++ b/drivers/rpmsg/rpmsg_char.c
> > @@ -494,6 +494,7 @@ static int rpmsg_eptdev_add(struct rpmsg_eptdev *eptdev,
> >         if (cdev)
> >                 ida_free(&rpmsg_minor_ida, MINOR(dev->devt));
> >  free_eptdev:
> > +       dev_err(&eptdev->dev, "failed to add %s\n", eptdev->chinfo.name);
> >         put_device(dev);
> >         kfree(eptdev);
> >
> > @@ -545,7 +546,6 @@ int rpmsg_anonymous_eptdev_create(struct rpmsg_device *rpdev, struct device *par
> >
> >         ret =  rpmsg_eptdev_add(eptdev, chinfo, false);
> >         if (ret) {
> > -               dev_err(&eptdev->dev, "failed to add %s\n", eptdev->chinfo.name);
> >                 return ret;
> >         }
> >
> > @@ -561,6 +561,8 @@ int rpmsg_anonymous_eptdev_create(struct rpmsg_device *rpdev, struct device *par
> >
> >         if (!ret)
> >                 *pfd = fd;
> > +       else
> > +               put_device(&eptdev->dev);
> >
> >         return ret;
> >  }
> >
> > Mathieu, Bjorn,
> >
> > What do you expect me to do about it?
> > 1. Send an independent fix patch.
> > 2. Squash the fix patch into previous ones and resend series again.
> > 3. Wait for other (if any) bug reports and fix them in a whole.
> >
> > I am fine with all of them.
> >
>
> Please send another patch I can apply on top.

I haven't received a fix for this yet.  After looking into this bug
report with more scrutiny I am of the opinion that @eptdev should be
free'd in rpmsg_anonymous_eptdev_create() where it was allocated.
Furthermore, if function anon_inode_getfd() in
rpmsg_anonymous_eptdev_create() fails, function
rpmsg_eptdev_release_device() will be called but I don't see a call to
cdev_device_del() in there.  Am I missing something?

>
> > Thanks,
> >
> >         Dawei
> >
