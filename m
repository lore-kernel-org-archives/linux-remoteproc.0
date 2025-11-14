Received: from out-180.mta0.migadu.com (out-180.mta0.migadu.com [91.218.175.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C5D5322DCB
	for <linux-remoteproc@vger.kernel.org>; Fri, 14 Nov 2025 14:23:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763130229; cv=none; b=I/c66nymHejpma0Mi6BY1kZ+FS1hTZu7VIRa0T9At0B3hpZA5O84bzZn8RMTtY5GBHplgKzUsvTzKM+p+m1XciqYcZS/TFDALxS/Yb1YisikhlWgGRQMaWKGZvmhsfz1CBlITuTUqEi91sA2lNlsIVF3DBz6P0HKNSLJosWJFnA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763130229; c=relaxed/simple;
	bh=2HghHUrkl5db0zEbNZE3HDsjkTGa1InKkbx0W70I7zE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hY3TvXphQ/HO6lhnDQhWXlue/dKjlcOwfyeONFw1TyK7wHfmxIxaJqYw4/gPer+3meNPB4iPR/fVj8Y4hRlV86IITbsjfS5XbrkG7YdfzDev4t03DchQih8z6AsZ9ohFUVtFJRNifGRBU4VDEW8H0xAWK6+LqhCKdxxLAwREv/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=rBqOsu4X; arc=none smtp.client-ip=91.218.175.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="rBqOsu4X"
Date: Fri, 14 Nov 2025 22:23:29 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1763130215;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=edbg6kSgtlnvu7vls6v+XLyNrvXdah8IKPMkEwyjJUo=;
	b=rBqOsu4XzAKoovKNoPXeQ8Tln72B1IHrM3BHp9bcLAqbJBScFvu28TB7M4lVWu7caqN1Sg
	t9GAUMRhTCeGYZIPmf7RG6C2pZfNIebinnNAgZLusE+Nb0dGTcTApdnR19rTf9jGSb4L0v
	9vbcSFnSwysxAl5Vxb2FuAE3+evtqnw=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Dawei Li <dawei.li@linux.dev>
To: Zhongqiu Han <zhongqiu.han@oss.qualcomm.com>
Cc: andersson@kernel.org, mathieu.poirier@linaro.org,
	linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
	set_pte_at@outlook.com, stable@vger.kernel.org
Subject: Re: [PATCH v3 1/3] rpmsg: char: Remove put_device() in
 rpmsg_eptdev_add()
Message-ID: <20251114142329.GA5858@wendao-VirtualBox>
References: <20251113153909.3789-1-dawei.li@linux.dev>
 <20251113153909.3789-2-dawei.li@linux.dev>
 <b754155b-a17b-4e8e-92b7-8ab37949dded@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b754155b-a17b-4e8e-92b7-8ab37949dded@oss.qualcomm.com>
X-Migadu-Flow: FLOW_OUT

Hi,

Thanks for the review.

On Fri, Nov 14, 2025 at 05:53:14PM +0800, Zhongqiu Han wrote:
> On 11/13/2025 11:39 PM, Dawei Li wrote:
> > put_device() is called on error path of rpmsg_eptdev_add() to cleanup
> > resource attached to eptdev->dev, unfortunately it's bogus cause
> > dev->release() is not set yet.
> > 
> > When a struct device instance is destroyed, driver core framework checks
> > the possible release() callback from candidates below:
> > - struct device::release()
> > - dev->type->release()
> > - dev->class->dev_release()
> > 
> > Rpmsg eptdev owns none of them so WARN() will complaint the absence of
> > release():
> 
> Hi Dawei,
> 
> 
> > 
> > [  159.112182] ------------[ cut here ]------------
> > [  159.112188] Device '(null)' does not have a release() function, it is broken and must be fixed. See Documentation/core-api/kobject.rst.
> > [  159.112205] WARNING: CPU: 2 PID: 1975 at drivers/base/core.c:2567 device_release+0x7a/0x90
> > 
> 
> 
> Although my local checkpatch.pl didn’t complain about this log line
> exceeding 75 characters, could we simplify it or just provide a summary
> instead?
> 
> 
> > Fixes: c0cdc19f84a4 ("rpmsg: Driver for user space endpoint interface")
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Dawei Li <dawei.li@linux.dev>
> > ---
> >   drivers/rpmsg/rpmsg_char.c | 1 -
> >   1 file changed, 1 deletion(-)
> > 
> > diff --git a/drivers/rpmsg/rpmsg_char.c b/drivers/rpmsg/rpmsg_char.c
> > index 34b35ea74aab..1b8297b373f0 100644
> > --- a/drivers/rpmsg/rpmsg_char.c
> > +++ b/drivers/rpmsg/rpmsg_char.c
> > @@ -494,7 +494,6 @@ static int rpmsg_eptdev_add(struct rpmsg_eptdev *eptdev,
> >   	if (cdev)
> >   		ida_free(&rpmsg_minor_ida, MINOR(dev->devt));
> >   free_eptdev:
> > -	put_device(dev);
> 
> 
> Yes, remove put_device can solve the warning issue, however it would
> introduce one memleak issue of kobj->name.


> 
> https://git.kernel.org/pub/scm/linux/kernel/git/remoteproc/linux.git/tree/drivers/rpmsg/rpmsg_char.c#n381
> 
> 
> dev_set_name(dev, "rpmsg%d", ret); is already called, it depends on
> put_device to free memory, right?

Good catch.

If it's just device name being leaked, just postpone dev_set_name till
every resource was allocated successfully. 

[Copying your comment on patch3/3]

> As I mentioned about the potential memory leak issue in patch 1/3, we
> could consider still using put_device for management, as this better
> aligns with the driver model standards and avoids potential issue.
> However, this requires assigning the release function in advance and
> also handling the special case where ida allocation fails in
> rpmsg_eptdev_add (removing the manual ida release).

But I agree with you, every data structure embedding struct device
should bind its life cycle management to struct devcice, that's what
driver core is designed. But it's bit tricky to implement your proposed
approach, especially considering backing port to stable kernel. A
possible solution could be:

diff --git a/drivers/rpmsg/rpmsg_char.c b/drivers/rpmsg/rpmsg_char.c
index 34b35ea74aab..e223a5452a75 100644
--- a/drivers/rpmsg/rpmsg_char.c
+++ b/drivers/rpmsg/rpmsg_char.c
@@ -408,8 +408,13 @@ static void rpmsg_eptdev_release_device(struct device *dev)
 {
        struct rpmsg_eptdev *eptdev = dev_to_eptdev(dev);
 
-       ida_free(&rpmsg_ept_ida, dev->id);
-       if (eptdev->dev.devt)
+       /*
+        * release() can be invoked from error path of rpmsg_eptdev_add(),
+        * WARN() will be fired if ida_free() is feed with invaid ID.
+        */
+       if (likely(ida_exists(&rpmsg_ept_ida, dev->id)))
+               ida_free(&rpmsg_ept_ida, dev->id);
+       if (eptdev->dev.devt && likely(ida_exists(&rpmsg_minor_ida, MINOR(eptdev->dev.devt))))
                ida_free(&rpmsg_minor_ida, MINOR(eptdev->dev.devt));
        kfree(eptdev);
 }
@@ -458,6 +463,8 @@ static int rpmsg_eptdev_add(struct rpmsg_eptdev *eptdev,
        struct device *dev = &eptdev->dev;
        int ret;
 
+       dev->release = rpmsg_eptdev_release_device;
+
        eptdev->chinfo = chinfo;
 
        if (cdev) {
@@ -471,7 +478,7 @@ static int rpmsg_eptdev_add(struct rpmsg_eptdev *eptdev,
        /* Anonymous inode device still need device name for dev_err() and friends */
        ret = ida_alloc(&rpmsg_ept_ida, GFP_KERNEL);
        if (ret < 0)
-               goto free_minor_ida;
+               goto free_eptdev;
        dev->id = ret;
        dev_set_name(dev, "rpmsg%d", ret);
 
@@ -480,22 +487,13 @@ static int rpmsg_eptdev_add(struct rpmsg_eptdev *eptdev,
        if (cdev) {
                ret = cdev_device_add(&eptdev->cdev, &eptdev->dev);
                if (ret)
-                       goto free_ept_ida;
+                       goto free_eptdev;
        }
 
-       /* We can now rely on the release function for cleanup */
-       dev->release = rpmsg_eptdev_release_device;
-
        return ret;
 
-free_ept_ida:
-       ida_free(&rpmsg_ept_ida, dev->id);
-free_minor_ida:
-       if (cdev)
-               ida_free(&rpmsg_minor_ida, MINOR(dev->devt));
 free_eptdev:
        put_device(dev);
-       kfree(eptdev);
 
        return ret;
 }

ida_exists() is introduced in 7fe6b987166b9, which is beyond the
coverage of every stable kernel, and the commit this patch is fixing
(c0cdc19f84a4) is contained in almost every stable kernel maintained.

Thanks,

	Dawei

> 
> 
> >   	kfree(eptdev);
> >   	return ret;
> 
> 
> -- 
> Thx and BRs,
> Zhongqiu Han
