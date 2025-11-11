Received: from out-180.mta0.migadu.com (out-180.mta0.migadu.com [91.218.175.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 170293AA1A8
	for <linux-remoteproc@vger.kernel.org>; Tue, 11 Nov 2025 12:53:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762865592; cv=none; b=SJxa5uLJuaCh0AdkNrNu9JKDqWLlqtVIwv7zmILqL0tKhUWRwnHiMby2Pg5EsgdqYJYEBLrT6iVGEUZnjqCfvoT9XMLnR+acKumSLVx4sbQJEa0gs0nyYNW/wQ3DgIl5O9YQJ013Tg4PlHDf8glGuEQKJwyBNKUEOpLg14BFomI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762865592; c=relaxed/simple;
	bh=fT3bnusM2NvS3KE+sLCfsFOKIa01BdAc38ni8ocv33E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=F6K/kjJgMYp1IwP0jgx750FikSyf5bfDO/AHmr1YVV/c0B4ZlM+lZVRLghxz7XBWjR9zjrVfthLCCp2BaBNpxsJIqeUNmXg3AlXreWh8ZePTKMO8MHVWDPihlm4vnL4l637P8gmtAGO6rOLDNwvNAYqboMpEwo0+S1w8oV133l8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=NuGaXHvR; arc=none smtp.client-ip=91.218.175.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="NuGaXHvR"
Date: Tue, 11 Nov 2025 20:53:02 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1762865587;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=giX7yvWfx4mnNj0ve/8srrjYpJOji6XS2pPoBtueDto=;
	b=NuGaXHvRo3J9IuhiUCtq4hRwTiky6dM8XSU8Nk/7/ScR4NnnH7TjxCXk7PmApAb34gLi1r
	6/UWKiIVr9Nw0PnGhexuXuO0oc887NmOGugpmEIstiNK1gmRZmXoSaOl9UW7MraRjiewl5
	OnBCRhOfj5qB/JWm7mAK6DhAeRqFrDI=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Dawei Li <dawei.li@linux.dev>
To: Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: Dan Carpenter <dan.carpenter@linaro.org>,
	linux-remoteproc@vger.kernel.org, andersson@kernel.org,
	dawei.li@linux.dev
Subject: Re: [bug report] rpmsg: char: Implement eptdev based on anonymous
 inode
Message-ID: <20251111125302.GA183476@wendao-VirtualBox>
References: <aPi6gPZE2_ztOjIW@stanley.mountain>
 <20251022155351.GA59635@wendao-VirtualBox>
 <CANLsYkzQ9qFWw5MAaWt20WdmUdNweoPvX7rspp7WZxnvM96V7Q@mail.gmail.com>
 <CANLsYkxTqz3QnuO3MEJoDx=ad43YbUNKiU_xtEzfiV+XAaGbdA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CANLsYkxTqz3QnuO3MEJoDx=ad43YbUNKiU_xtEzfiV+XAaGbdA@mail.gmail.com>
X-Migadu-Flow: FLOW_OUT

Hi Mathieu, 

On Mon, Nov 10, 2025 at 10:05:44AM -0700, Mathieu Poirier wrote:
> On Wed, 22 Oct 2025 at 10:41, Mathieu Poirier
> <mathieu.poirier@linaro.org> wrote:
> >
> > On Wed, 22 Oct 2025 at 09:54, Dawei Li <dawei.li@linux.dev> wrote:

[...]

> > > >     546         ret =  rpmsg_eptdev_add(eptdev, chinfo, false);
> > > >     547         if (ret) {
> > > > --> 548                 dev_err(&eptdev->dev, "failed to add %s\n", eptdev->chinfo.name);
> > > >                                  ^^^^^^                             ^^^^^^
> > > > The rpmsg_eptdev_add() function frees "eptdev" on error.
> > > >
> > > >     549                 return ret;
> > > >     550         }

[...]

> > > >     558         mutex_lock(&eptdev->ept_lock);
> > > >     559         ret = __rpmsg_eptdev_open(eptdev);
> > > >
> > > > Should we free eptdev if __rpmsg_eptdev_open() fails?
> > > >
> > > >     560         mutex_unlock(&eptdev->ept_lock);

> > >
> > > Diff below should do the trick.
> > >
> > > diff --git a/drivers/rpmsg/rpmsg_char.c b/drivers/rpmsg/rpmsg_char.c
> > > index 34b35ea74aab..c322df56394f 100644
> > > --- a/drivers/rpmsg/rpmsg_char.c
> > > +++ b/drivers/rpmsg/rpmsg_char.c
> > > @@ -494,6 +494,7 @@ static int rpmsg_eptdev_add(struct rpmsg_eptdev *eptdev,
> > >         if (cdev)
> > >                 ida_free(&rpmsg_minor_ida, MINOR(dev->devt));
> > >  free_eptdev:
> > > +       dev_err(&eptdev->dev, "failed to add %s\n", eptdev->chinfo.name);
> > >         put_device(dev);
> > >         kfree(eptdev);
> > >
> > > @@ -545,7 +546,6 @@ int rpmsg_anonymous_eptdev_create(struct rpmsg_device *rpdev, struct device *par
> > >
> > >         ret =  rpmsg_eptdev_add(eptdev, chinfo, false);
> > >         if (ret) {
> > > -               dev_err(&eptdev->dev, "failed to add %s\n", eptdev->chinfo.name);
> > >                 return ret;
> > >         }
> > >
> > > @@ -561,6 +561,8 @@ int rpmsg_anonymous_eptdev_create(struct rpmsg_device *rpdev, struct device *par
> > >
> > >         if (!ret)
> > >                 *pfd = fd;
> > > +       else
> > > +               put_device(&eptdev->dev);
> > >
> > >         return ret;
> > >  }
> > >

[...]

> >
> > Please send another patch I can apply on top.
> 
> I haven't received a fix for this yet.  After looking into this bug

Sorry about the late response.

> report with more scrutiny I am of the opinion that @eptdev should be
> free'd in rpmsg_anonymous_eptdev_create() where it was allocated.

Yes, and it's exactly what diff above is doing.

> Furthermore, if function anon_inode_getfd() in
> rpmsg_anonymous_eptdev_create() fails, function
> rpmsg_eptdev_release_device() will be called but I don't see a call to
> cdev_device_del() in there.  Am I missing something?

1. rpmsg_anonymous_eptdev_create() does _not_ create cdev, so it's not
   supposed to call cdev_device_del().
   https://git.kernel.org/pub/scm/linux/kernel/git/remoteproc/linux.git/tree/drivers/rpmsg/rpmsg_char.c?h=rpmsg-next#n546

2. So I assume you mean "what about epdev based on chardev?". It's
   simply because cdev cleanup job is on rpmsg_chrdev_eptdev_destroy(),
   _not_ rpmsg_eptdev_release_device().

So my proposed fix patch still holds, IIUC:

Author: Dawei Li <dawei.li@linux.dev>
Date:   Sun Oct 26 23:18:06 2025 +0800

    rpmsg: char: Fix UAF and memory leak

    Potential UAF and memory leak exsit in exception handling paths for
    rpmsg_anonymous_eptdev_create(), fix them.

    Fixes: 2410558f5f11 ("rpmsg: char: Implement eptdev based on anonymous inode")
    Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
    Closes: https://lore.kernel.org/all/aPi6gPZE2_ztOjIW@stanley.mountain/
    Signed-off-by: Dawei Li <dawei.li@linux.dev>

diff --git a/drivers/rpmsg/rpmsg_char.c b/drivers/rpmsg/rpmsg_char.c
index 34b35ea74aab..c322df56394f 100644
--- a/drivers/rpmsg/rpmsg_char.c
+++ b/drivers/rpmsg/rpmsg_char.c
@@ -494,6 +494,7 @@ static int rpmsg_eptdev_add(struct rpmsg_eptdev *eptdev,
        if (cdev)
                ida_free(&rpmsg_minor_ida, MINOR(dev->devt));
 free_eptdev:
+       dev_err(&eptdev->dev, "failed to add %s\n", eptdev->chinfo.name);
        put_device(dev);
        kfree(eptdev);

@@ -545,7 +546,6 @@ int rpmsg_anonymous_eptdev_create(struct rpmsg_device *rpdev, struct device *par

        ret =  rpmsg_eptdev_add(eptdev, chinfo, false);
        if (ret) {
-               dev_err(&eptdev->dev, "failed to add %s\n", eptdev->chinfo.name);
                return ret;
        }

@@ -561,6 +561,8 @@ int rpmsg_anonymous_eptdev_create(struct rpmsg_device *rpdev, struct device *par

        if (!ret)
                *pfd = fd;
+       else
+               put_device(&eptdev->dev);

        return ret;
 }

I will send the fix patch if you find it not offending.

Thanks,

	Dawei
