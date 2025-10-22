Received: from out-171.mta1.migadu.com (out-171.mta1.migadu.com [95.215.58.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C419624C692
	for <linux-remoteproc@vger.kernel.org>; Wed, 22 Oct 2025 15:54:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761148469; cv=none; b=Gh5uiiPWU9rESznwPpqza986tyvcjAMKT6gd864SeeV8dldb1cfv8FaorXUYYCtFzBN+Xr1pQwq+qTI8gOctKuknYERR2wDejyx0vCUB/tm7e+utJUMIDFs9obAoBAnmHmJtIAfaW6hPw+Db8ODRre2wid9b9M9BlQC+ZZoQyHg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761148469; c=relaxed/simple;
	bh=4Kw399Q+8+qIdxRkgF63I0LgX6tSHyatcQ+K62X3LdA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=r12a8F5KrzH7qhznN94DdG7A+S/xou5lSZjlwZGI7C+TC4cbFhqldPzFKnF0E+aOCubXPHO1XLPWzXWztmcHH/VVO/BsJrglotK/uRqWd9LuMDIYxNLoq7sGLWehrbVWLtVHjEBY/4utkoTfo/nAaH2GPuy1RXBdrmLWQD/dSxw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=cO8wB6/1; arc=none smtp.client-ip=95.215.58.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="cO8wB6/1"
Date: Wed, 22 Oct 2025 23:53:51 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1761148464;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=OkUsWNTBphfOKy1H9Ay6FDIuMYnKd9HqEiCpzfhqExk=;
	b=cO8wB6/14mBmvFDlFVyWo0f0Dwp9n303F8FIp1ZVVc/Ys8CnxWdsVabRKWZ1hOl7sHoQBC
	5ar1iLhfJbEA2gJ15Ksxf3wUZK5aOJReoUbb1U0tMJJFZmkeVhv/kvo/SmoncY6DoBfSW8
	xV/+z7hoGEXdM8dSDB5b8H3CWt9SymU=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Dawei Li <dawei.li@linux.dev>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: linux-remoteproc@vger.kernel.org, andersson@kernel.org,
	mathieu.poirier@linaro.org
Subject: Re: [bug report] rpmsg: char: Implement eptdev based on anonymous
 inode
Message-ID: <20251022155351.GA59635@wendao-VirtualBox>
References: <aPi6gPZE2_ztOjIW@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aPi6gPZE2_ztOjIW@stanley.mountain>
X-Migadu-Flow: FLOW_OUT

Hi Dan,

Thanks for the report.

On Wed, Oct 22, 2025 at 02:05:36PM +0300, Dan Carpenter wrote:
> Hello Dawei Li,
> 
> Commit 2410558f5f11 ("rpmsg: char: Implement eptdev based on
> anonymous inode") from Oct 15, 2025 (linux-next), leads to the
> following Smatch static checker warning:
> 
> 	drivers/rpmsg/rpmsg_char.c:548 rpmsg_anonymous_eptdev_create()
> 	error: dereferencing freed memory 'eptdev' (line 546)
> 
> drivers/rpmsg/rpmsg_char.c
>     538         /* Anonymous inode only supports these file flags */
>     539         if (flags & ~(O_ACCMODE | O_NONBLOCK | O_CLOEXEC))
>     540                 return -EINVAL;
>     541 
>     542         eptdev = rpmsg_eptdev_alloc(rpdev, parent, false);
>     543         if (IS_ERR(eptdev))
>     544                 return PTR_ERR(eptdev);
>     545 
>     546         ret =  rpmsg_eptdev_add(eptdev, chinfo, false);
>     547         if (ret) {
> --> 548                 dev_err(&eptdev->dev, "failed to add %s\n", eptdev->chinfo.name);
>                                  ^^^^^^                             ^^^^^^
> The rpmsg_eptdev_add() function frees "eptdev" on error.
> 
>     549                 return ret;
>     550         }
>     551 
>     552         fd = anon_inode_getfd("rpmsg-eptdev", &rpmsg_anonymous_eptdev_fops, eptdev, flags);
>     553         if (fd < 0) {
>     554                 put_device(&eptdev->dev);
>     555                 return fd;
>     556         }
>     557 
>     558         mutex_lock(&eptdev->ept_lock);
>     559         ret = __rpmsg_eptdev_open(eptdev);
> 
> Should we free eptdev if __rpmsg_eptdev_open() fails?
> 
>     560         mutex_unlock(&eptdev->ept_lock);
>     561 
>     562         if (!ret)
>     563                 *pfd = fd;
>     564 
>     565         return ret;
>     566 }
> 
> regards,
> dan carpenter

Diff below should do the trick.

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

Mathieu, Bjorn,

What do you expect me to do about it?
1. Send an independent fix patch.
2. Squash the fix patch into previous ones and resend series again.
3. Wait for other (if any) bug reports and fix them in a whole.

I am fine with all of them.

Thanks,

	Dawei
