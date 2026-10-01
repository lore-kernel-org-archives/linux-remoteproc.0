Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2F5A41A506
	for <linux-remoteproc@vger.kernel.org>; Thu,  1 Oct 2026 16:50:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790873425; cv=none; b=BjhzrDmlXSvyXgtMcJoLaieTuLIyVPJPG3+U4l7D6TQEHHJ+eYfO5Mts/tZA1S6NaMlUQaQaRiWcrETUazqJUbckwq7NnmYhmU7EosQIh6Shij5ztYhY2zXTk5uEPlJ4sp8nAM1mZb1Xh44JlBCSXi2uNbTaNfU+wWw9nUaCtPs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790873425; c=relaxed/simple;
	bh=QSJ24e+pWCyCXE2eunfAAcOCjCU6zm7GnfTg2Wfuq/Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kdVRMWMXOqMvrqGgMvza6v31sDrkAPyILwYuD6GtJHX985266wYFDg581oA5OnvbBIlOoLY64msqppu6K2tYdtepMOVmk+lsf4R6c5CKLc+FVrYkMe/oJP/4jCReGHS7o4zWwbmUVfJCX2vn6kzdm9RAHavakIv445k+lBZCBtY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=UmKwXGLg; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="UmKwXGLg"
Received: by mail-pj2-f13.google.com with SMTP id d9443c01a7336-2d90ba1d807so53601655ad.3
        for <linux-remoteproc@vger.kernel.org>; Thu, 01 Oct 2026 09:50:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1790873423; x=1791478223; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=tgVV1+ohgrdPmnn55ueLtzmq5w92i8+bjyV4Zdoclo4=;
        b=UmKwXGLgw/ksufPxGB9bMgTzjFg8nUQgvbj0iFRgila75MA1lGxQyTHetAqE1JjK5X
         Zp6e7zn1NQk2lTPcIiRfqdI4sSp+fPGsbeFTnMH0Kdsxlu/1Mao8OQEQHF1AJqn/ENhD
         aMX3QGYdgYIpZrLlZEaQNRQxLxaXXYJSNQD/Rz78BN5HN+xAIkLCWviIbS+QbVptzftE
         lcpaIUE1Im5m9yKsE9UgILGKIsPMcf3xXVw9cllVvv8MB4NVROXJsXgf81F1qdE1sWnO
         XHGLzteYpkvz0l1OTkZpYW8/YRcMDPbZhXbSjJZTxi4z1MmIcEbm38WIh9Z3wsYtiPqD
         fePA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790873423; x=1791478223;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tgVV1+ohgrdPmnn55ueLtzmq5w92i8+bjyV4Zdoclo4=;
        b=Q7r5MK3aOPX2E96+uXl96m2PgpgAMdMMQmb8H2YVHT2GmAYSr/Grb2HPoJjAka+F3X
         mrCaapXfZbJAdAu9V/AeQ14Lp7yhxuYiZieUeCiBsY+h2xYbZEUj09XTvCD4ZYQf9os8
         D0bI0OwRFrzgRtGqEVUjyyuJxV4/srA7QGRjVSrEvwQ1EfErjB0BmCT7uLkvJ/WCMZql
         nL/fawoPyRTusAm7HFQT4FdPbyldMzcTvTuZZZ25bC22ZYhV1F5xfIV6ibkud+BnP7Q2
         oE9f2KokaDudnwxvgCZIBDnQhWcClozHxGvaVQbe4rwCbhemsrRH5AgP5UNgGyivsMw6
         04/A==
X-Forwarded-Encrypted: i=1; AKwUvByE08Xh7EOZ1nopAD3pjgRuz6vvv9OxZsbOrhycOvKz5l/oIli8P+9sOpOE8ihvqUNhv23SGVjGBYxzZKzbt6U3@vger.kernel.org
X-Gm-Message-State: AFq9FYL6Czm/xCSuSMa1aanOi8Vs/W4l9V+TaArApRR1LyUeIJ2Hs7LF
	IEKD9tzyqNtBrKeFlqNCyhDlSXMf/QjXoPpqy+EISHel0wmw3lcD3gqoCVKlCiZI0EE=
X-Gm-Gg: AYBFou0KUIWIx0T6tfk8M6jcM9NEHHgSFF7+/haxEKRA5BxD9GIHn8kyeY8F4woFQaC
	hTrgU/lSVwRAbTKpS+mfjOibh7uAGN/Mucp37sqJvUr/KeNh8E67XEbGSydn7IERHnl3B6VKYm/
	d8Km5gXX6AlvWtWfQeXGySc8xE8sPlQSk/Mk6Rt8yPbCeFIb9bAu5dCxZxql8jo9uQ3xVkg8C0D
	LMSfJbcVT2mQk4x8NiUxYARz7DXzoIvk4ZsclneOcMAZMA0AGFVamS7hmDI8PtpWJre5sCy1786
	sYCUX13RIaU3zsnGqDtxOBaPgwihwV4ki3gY3/GOh1BnWjm/jcqJYn+kbj8Ib4qd7YGm6XQTZpU
	1jxtjBD7JoiFPOKixSUAkJEjqYNxD8FUn0ggULVqQ8997IV3jkp3HCLo/Glbj1vqc3Q8nFjzIsY
	aSiaSSGDjkQCEcrHYnEfO2DEEc0LJOKOI+djQCgbWNtwdCLzRULkDkF+aCCQIM+wBSKlXPkOgHs
	w==
X-Received: by 2002:a17:902:da91:b0:2df:83ce:724f with SMTP id d9443c01a7336-2e49b615cf2mr386185ad.30.1790873422943;
        Thu, 01 Oct 2026 09:50:22 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:75d2:ead5:9c07:75b9])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e30099a3e5sm13724245ad.24.2026.10.01.09.50.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 09:50:22 -0700 (PDT)
Date: Thu, 1 Oct 2026 10:50:20 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Francesco Valla <francesco@valla.it>
Cc: Tanmay Shah <tanmay.shah@amd.com>, andersson@kernel.org,
	ohad@wizery.com, linux-remoteproc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] remoteproc: remoteproc_virtio: reset vdev before
 removing it
Message-ID: <ar6PTLS194v3YJPU@p14s>
References: <20260924205901.2505186-2-tanmay.shah@amd.com>
 <arjZvftSMlG3OMHP@bywater>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <arjZvftSMlG3OMHP@bywater>

On Sun, Sep 27, 2026 at 10:55:59AM +0200, Francesco Valla wrote:
> Hi Tanmay,
> 
> On Thu, Sep 24, 2026 at 01:59:02PM -0700, Tanmay Shah wrote:
> > The virtio device is removed when the remoteproc device is removed. The
> > driver should issue reset on the virtio device so the remote can do
> > corresponding cleanup.
> > 
> 
> Shouldn't be the driver, and not the transport, the one that calls
> virtio_reset_device()?

Function rproc_remove_virtio_dev() calls unregister_virtio_device(), which calls
device_unregister(), which should end up calling virtio_bus.remove(), in this
case virtio_dev_remove().  virtio_dev_remove() calls drv->remove().  If we take
the RPMSG driver, rpmsg_remove() calls virtio_reset_device(), so explicitly
resetting devices as part of rproc_remove_virtio_dev() is not needed.  

Tanmay, have you observed a scenario where the above isn't working?

> 
> > Fixes: 7a186941626d ("remoteproc: remove the single rpmsg vdev limitation")
> > Signed-off-by: Tanmay Shah <tanmay.shah@amd.com>
> > ---
> >  drivers/remoteproc/remoteproc_virtio.c | 2 ++
> >  1 file changed, 2 insertions(+)
> > 
> > diff --git a/drivers/remoteproc/remoteproc_virtio.c b/drivers/remoteproc/remoteproc_virtio.c
> > index d5e9ff045a28..1cb0ee0ea656 100644
> > --- a/drivers/remoteproc/remoteproc_virtio.c
> > +++ b/drivers/remoteproc/remoteproc_virtio.c
> > @@ -469,6 +469,8 @@ static int rproc_remove_virtio_dev(struct device *dev, void *data)
> >  {
> >  	struct virtio_device *vdev = dev_to_virtio(dev);
> >  
> > +	virtio_reset_device(vdev);
> > +
> >  	unregister_virtio_device(vdev);
> >  	return 0;
> >  }
> > 
> > base-commit: 5f639b3018c0026a5341949724b4b921cf3a3d5d
> > -- 
> > 2.43.0
> > 
