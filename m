Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 940D63AE19D
	for <linux-remoteproc@vger.kernel.org>; Tue,  8 Sep 2026 08:06:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788854810; cv=none; b=eeHkFxvggZl81rrctsLztAgwFajUfYdUNZ/6dg3cw0t3GvN6iMUdQXsTS7+RFddw9KTbzuP2LJqLc+Oh9uBlswehwK0ZIolyMPuf1nWvSaiVM9bXyYsXDC3lFrPVwTxqmLWQIVljvpUr+YYTKsiRS2hhwZrrLjKVfOQ1+7Kxx5g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788854810; c=relaxed/simple;
	bh=AivX6AuleTT2UUgXHx1AcQwy3wqdj43sykXnred/aXA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YWKxmSLwa2gsUdUYK4/YwMuA9luexzLv+z3Jvao/64sinifrfMCyFt7CO9ereeOmZDsEobGxcreGBbkJz7NkvZQhuOMeYeUZxzR8Zc+NdWqDN4BJEkgbA60FVeQdW4i3SmfKmKKSJOFsOBcL3nj+ML+i27j6G40f0wlKAMBzYIU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=agqUC0k3; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=SbMqKPWX; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="agqUC0k3";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="SbMqKPWX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1788854807;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=qlpA25HriXdx9v6T6FYmtvmjD7yzSHEf8Vv9SuYbJrQ=;
	b=agqUC0k3rfHzEHi/BNs8nDCpNVfMLArazlyCV5N1zSj+YV4+qXFkO3UgmsWMOrSM2VEMd0
	zS8IHuhyYRQpWdgHuvl3UzqHb1e04JKR5E6BCOnJZLw5Q86k8zpZQZXNzgyxIHKUMR2d2h
	xG23I1WTxi5JtxnhSVjfoQ9Czt3GyHY=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-195-OdbJxB82M8uyOcrl_AwlfQ-1; Tue, 08 Sep 2026 04:06:46 -0400
X-MC-Unique: OdbJxB82M8uyOcrl_AwlfQ-1
X-Mimecast-MFC-AGG-ID: OdbJxB82M8uyOcrl_AwlfQ_1788854805
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-496bbcf7d1eso39429795e9.0
        for <linux-remoteproc@vger.kernel.org>; Tue, 08 Sep 2026 01:06:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1788854805; x=1789459605; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=qlpA25HriXdx9v6T6FYmtvmjD7yzSHEf8Vv9SuYbJrQ=;
        b=SbMqKPWXnzZ9gm+24v/NW9OSThf9QLKLRG2HDjF7RaTOJuDiedXP0CM985QD5CqHMF
         m59SAiFH8rKerclNJCim+KtMsdfIxa3iAUtjRcBjhW04frYNpS7qARIFQ6kOxfoDXH66
         XbXQKffei49hbSjqRcL1wCYEsfMRnL34xPLGmj6s58bNdJi55Hig2ARx8qC9mTRBjZwn
         Kykyu8uKm0HOXBTmMsM06Pd8APNBKRPqzCl7R0yR0QR6jUzCzGWtN9XPe0dh363+f5QC
         ZB2lSb7N5fJjS2XTduglItFeS7W+ijivHaKmOgqk1KlR4VDvUKGbX5k4akdx/Jk/HoI6
         j0FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788854805; x=1789459605;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qlpA25HriXdx9v6T6FYmtvmjD7yzSHEf8Vv9SuYbJrQ=;
        b=Jvb5uYzK21Jpr2MhNu9kHFvHY7K3CfIDOPPbKCUcYFT6ScQRJCEE9VWHKm4cLaYaGv
         GAx+Ew2adQ/o2A9Z6f3hb9hp8gdrKNIN+hpsMr99BYy9IJbHn+ptVLi/qdq0xd5Etio9
         jCO/bFCs+xgW62rKn6Fel3zAf5mhGM6NVsSpEpZIblpFI+X2GIg5PN6Wwis1n8rEP/OW
         iAa7+1tqzMVPLUd9TxXC161KmbJ9WiWr/Ny6acWkXd6PycpU7BTXVGOnmVtpMRik5cGJ
         O8IisX1tYSW/zDT1qH7udNs+MxITL6k6VYxT5GRqzILjpqjGihWdtx3GCe2MOsBx5ZJS
         5wPA==
X-Forwarded-Encrypted: i=1; AKwUvBwaLrIuEuL+ySITr1m85i+JI/tgjSE3HkKpLCawIRraMjHQ2UperO1sVHCfn/0kMHhVJOTXqLYpo0qINtdHVt7a@vger.kernel.org
X-Gm-Message-State: AFuF++lvs6Fbc8WunXa0sH+vAtcvltsQflWb2KRC6qGnFr+XK4IrbTcR
	58Dnb6Os2oEQ8KKJCVMoX+bSzs1ykKlxz4rdfZnTEILLcnaVb6YFts9V3byJfXw6fjYHhQNiihN
	gDT3HcMLKYvED44xein9I11BiMyFz0M325q2AuamqVGiFHumm75mujD+EBpaFnoV960+ysL4=
X-Gm-Gg: AYBFou1DYob7zVDhNs2+OiTUr9q3z42XdV/zTDrv7yrbPL7rp+k8JoMcMuKEzPjQrA5
	Xo+ns68gHnz3zxDajMZJtA0uRGR8DzEa5Sx1/8GR/Ep6H+tsikXIwzzXojCJkPG18a+IxvRtziE
	QmRfERU2IrVYjHrAoRZvHOBqYmQAD8EYK/mdMymn0tniz7DHLTGuEkkHjyyiGsmhG5UycwR1cWx
	Y85V4tbgLav2TMRkMqpTVysmrIlZFZkwbjKv6q0VNX28+Swhq99af688/9dHh/lkyp5N1raczrU
	G6DGyH5EQvFrsGkjvfMvtQ7RvtQ2UOK4xhtaeGgJshAmc/D2uJhKzDg/s01xpLVdrvUMolJtogS
	kdexl0IyKW0mys39IY78YTOA=
X-Received: by 2002:a05:600c:6209:b0:49c:fed6:cd3f with SMTP id 5b1f17b1804b1-49cfed6cd4dmr208433955e9.23.1788854804736;
        Tue, 08 Sep 2026 01:06:44 -0700 (PDT)
X-Received: by 2002:a05:600c:6209:b0:49c:fed6:cd3f with SMTP id 5b1f17b1804b1-49cfed6cd4dmr208433115e9.23.1788854804098;
        Tue, 08 Sep 2026 01:06:44 -0700 (PDT)
Received: from redhat.com (IGLD-80-230-79-236.inter.net.il. [80.230.79.236])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49d08144037sm282102195e9.7.2026.09.08.01.06.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 01:06:43 -0700 (PDT)
Date: Tue, 8 Sep 2026 04:06:39 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Karl Mehltretter <kmehltretter@gmail.com>
Cc: Jason Wang <jasowangio@gmail.com>, Gerd Hoffmann <kraxel@redhat.com>,
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
	Eugenio =?iso-8859-1?Q?P=E9rez?= <eperezma@redhat.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Rusty Russell <rusty@rustcorp.com.au>,
	Pawel Moll <pawel.moll@arm.com>, Cornelia Huck <cohuck@redhat.com>,
	Halil Pasic <pasic@linux.ibm.com>,
	Eric Farman <farman@linux.ibm.com>,
	Richard Weinberger <richard@nod.at>,
	Anton Ivanov <anton.ivanov@cambridgegreys.com>,
	Johannes Berg <johannes@sipsolutions.net>,
	Hans de Goede <hansg@kernel.org>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Vadim Pasternak <vadimp@nvidia.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	virtualization@lists.linux.dev, linux-input@vger.kernel.org,
	linux-s390@vger.kernel.org, kvm@vger.kernel.org,
	linux-um@lists.infradead.org, platform-driver-x86@vger.kernel.org,
	linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>
Subject: Re: [PATCH v3 0/6] virtio: fix and add callback synchronization hooks
Message-ID: <20260908040141-mutt-send-email-mst@kernel.org>
References: <20260908053817.26065-1-kmehltretter@gmail.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260908053817.26065-1-kmehltretter@gmail.com>

On Tue, Sep 08, 2026 at 07:38:11AM +0200, Karl Mehltretter wrote:
> This is v3 of the callback synchronization series. It is based on
> Michael S. Tsirkin's linux-next branch at f49e6cf91942 ("virtio:
> synchronize callbacks after device reset"), which already contains the
> core change and the virtio_input teardown reorder from v2.


Pls note I dropped the core change for now.
That one needs more work:

- transport changes should be separate patches from core
  changes

- shutdown generally needs more work, it should disable
  config in particular just like remove does.
 
- drivers that queue work must have a shutdown callback to
  sync it - that part can be separate patchsets




> Patches 1 and 2 fix two bugs in virtio-ccw's existing
> synchronize_cbs() hook. After a fallback from adapter to classic
> interrupts it selects the wrong lock, and the classic interrupt handler
> only takes the matching lock when notification hardening is enabled.
> Patch 3 adds SRCU tracking for remoteproc callbacks, which can sleep.
> Patches 4 and 5 replace the RCU fallback with synchronization against
> the UML IRQ and the TmFIFO callback locks. The fallback already covers
> these IRQ handlers and spinlock sections. Patch 6 adds SRCU tracking
> in virtio_vdpa so callback synchronization does not depend on the
> context in which the vDPA driver invokes the callback.
> 
> The UML, TmFIFO and remoteproc reset paths do not themselves prevent
> new virtqueue callbacks. UML and TmFIFO only clear a status field, and
> remoteproc does not wait for the remote side to acknowledge the reset.
> Without notification hardening or driver-specific teardown protection,
> callbacks can still start after reset. The new synchronization hooks
> do not fix that. The TmFIFO hook also does not synchronize with the
> rest of the FIFO work item outside the callback locks.
> 
> The virtio_input loop change from v2 (continue instead of break, so
> events the device already completed are still delivered) and the
> event buffer leak are sent separately.
> 
> Changes in v3:
> - Rebased on Michael's linux-next branch. Dropped the core change and
>   the virtio_input patch, which are there already.
> - Split the virtio-ccw fixes out of the core patch, one per bug, and
>   the transport patch into one patch per transport. The CCW and TmFIFO
>   changes are functionally unchanged from v2.
> - Patch 2: added a Fixes tag and described the existing shutdown
>   case. Removed the dependency note on the core reset change.
> - remoteproc: read the queue pointer once in rproc_vq_interrupt(), and
>   synchronize with callbacks in __rproc_virtio_del_vqs() before
>   freeing the queues (Sashiko). Place vq_srcu next to rvdevs so the
>   hunk also applies to mainline, which added attach_work after index.
> - virtio_uml: compare against UM_IRQ_ALLOC instead of a bare negative
>   check.
> - virtio_vdpa: use SRCU instead of a per-device rwlock, so the
>   callback tracking uses per-CPU counters, and cover the config
>   callback (Sashiko).
> - Rewrote the commit messages. Corrected the RCU fallback description
>   for UML, TmFIFO and the vDPA simulators. Dropped the claimed simulator
>   reset race: the simulators disable bottom halves around virtqueue
>   callbacks and serialize reset with the worker's mutex.
> 
> Changes in v2:
> - Moved callback synchronization from virtio-pci into the core, as
>   Michael suggested, and added the missing synchronize_cbs() hooks.
> 
> Testing: the changed objects build with W=1 without warnings, with
> clang on arm64, x86-64 and s390 and with gcc on SMP UML, and the
> patches also apply to current mainline and linux-next. The runtime
> tests from v2 were not repeated on this version: the input, rebind and
> shutdown checks on arm64 MMIO and x86 PCI covered code that is
> unchanged here, and the remoteproc and virtio_vdpa hooks have only
> been build-tested. No remoteproc, TmFIFO or s390 hardware was
> available.
> 
> v2: https://lore.kernel.org/r/20260905152059.89560-1-kmehltretter@gmail.com
> v1: https://lore.kernel.org/r/20260818040433.66986-1-kmehltretter@gmail.com
> 
> Karl Mehltretter (6):
>   virtio_ccw: fix synchronize_cbs() after interrupt fallback
>   virtio_ccw: always take irq_lock in the classic interrupt handler
>   remoteproc: implement synchronize_cbs() for virtio devices
>   um: virtio_uml: implement synchronize_cbs()
>   platform/mellanox: mlxbf-tmfifo: implement synchronize_cbs()
>   virtio_vdpa: implement synchronize_cbs()
> 
>  arch/um/drivers/virtio_uml.c             | 10 +++++++
>  drivers/platform/mellanox/mlxbf-tmfifo.c | 15 ++++++++++
>  drivers/remoteproc/remoteproc_core.c     | 12 ++++++++
>  drivers/remoteproc/remoteproc_virtio.c   | 37 +++++++++++++++++++-----
>  drivers/s390/virtio/virtio_ccw.c         |  6 +---
>  drivers/virtio/virtio_vdpa.c             | 34 ++++++++++++++++++++--
>  include/linux/remoteproc.h               |  3 ++
>  7 files changed, 102 insertions(+), 15 deletions(-)
> 
> 
> base-commit: f49e6cf919425cc55f10fd7cda7e0fc895df4cc0
> -- 
> 2.39.5 (Apple Git-154)

