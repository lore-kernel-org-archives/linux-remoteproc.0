Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D64F2470EB9
	for <linux-remoteproc@vger.kernel.org>; Mon,  7 Sep 2026 13:13:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788786825; cv=none; b=sUy9SPCcOxmsUr1t5XiiQtBwlFcNnAs4nYgyIRepjP4Xz7Dg40EGSZuL/iHeBZj3spriu+N2kk4YD4vUvYWXqbw44zc3d8cH0RZXu56qAaWstJvG1IX+lWc7asFMy6kNP3MSTogZKY0QYssCW4kcgYMKgR8nQRYVDbAHbqiV8LU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788786825; c=relaxed/simple;
	bh=bbyM8+xnMNKO6fyiNZM2V/dxEjYjP4AdG79mC8RAzeM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YVVca5c+J2a4N1uBJakVcJOuifvpbXnEn4ichxPc6jk0zvjqsOTOA7DWGc1whjG19n2Qrct/qM/2HvLwh9KVb3XWN6h7Ni0wZ5VSFa3wQJ9oB+fGzqfHpWZBzKrhdzzh2k0ZZenjeCRXr3tay6pYd2Bry8Hm+5fRrxoereUZt7E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=NRam9ZQ0; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=gy0OdkN6; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="NRam9ZQ0";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="gy0OdkN6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1788786815;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=5punYBPTQYCYDbZdD+Tip6UD659TFwSyiVivgWnd/bQ=;
	b=NRam9ZQ0q+VV2VI6ALDXcJT+ogRe/30l7rxaoIdyVBYGufm1LtU/FWCSNmgOr97NrDrzqG
	VXyeErArjRZk26zKG4mTiGix1UNEqwpNmukeQpm2E/olxaaw6NtFPY0afZq8SCIg+WS0OP
	veDnz3dxiC9PgLebZiKHVIGac7Q79Yw=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-639-T2-U_MuKP_a69P2vhC0Ong-1; Mon, 07 Sep 2026 09:13:34 -0400
X-MC-Unique: T2-U_MuKP_a69P2vhC0Ong-1
X-Mimecast-MFC-AGG-ID: T2-U_MuKP_a69P2vhC0Ong_1788786814
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-4994d67d0e3so24459965e9.2
        for <linux-remoteproc@vger.kernel.org>; Mon, 07 Sep 2026 06:13:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1788786813; x=1789391613; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5punYBPTQYCYDbZdD+Tip6UD659TFwSyiVivgWnd/bQ=;
        b=gy0OdkN6w26QFaOXv6fYnw8KuIo1/jlD0unXb1oGGSeoNrDrS7mYYQLaJiR6oDbzMF
         teCyJbW66P7C3M/aCB9FZfW+5GRRyDB/Rq23ykl1KB6k6eksjLwb7l90ZQy4ALCGjylK
         6ZOXfRnWwOfMy6iTBarbpaBKWoubHxdVWsuBaQu9mHs5IfpFxxQCrLk46MSzhThSPjri
         hJsPXQCudWjdBKNId+zsEFwKwQ+gw1HAGxC4t2g7VTaF85nzmkRhKfrBlJyDA26flBYq
         Qxwzw6UqsPJ8Xu/wgOVuhnlDkwpo6is8QNCtDEqp6tzuI+6LnV0tahMLVEy12wjsjcMr
         fvtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788786813; x=1789391613;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5punYBPTQYCYDbZdD+Tip6UD659TFwSyiVivgWnd/bQ=;
        b=NKoD7PcEkcMFyn8KjMzp42ou1mLeGixs5GhcyTOj+O3FDE9GVEjoZ14PbTp+JhoIX/
         U3KZWUd0C11NY9kQvzDwGupWZsRcQEap7WyqSk7E2SuGoKMlM+lnsIE+S0KecGQQa2fC
         azbm6r/1JRCIWnQcmx5Esp2phhEv09kVTYaarCzsIn3Td2Dnt5DV6vzNKWm/ClC9SXxZ
         fQ38JiZaYoUbjlfM5yQm31bgntLRZjYJVSw7y2H+H2mjw91djQzbsvQvCdxZDBAEIJff
         wtU4cvQ5eIAmmdjPOpQRC0ZrAboTLO2eE2t/vmHQ8vAlmQh9IbldXCwMao6ZjiMAgQGF
         Wkmg==
X-Forwarded-Encrypted: i=1; AKwUvBxF92b01pan+6CC+l4lLZrdHzPxfXAPSylvBeT6gW2xb/C1XGIYqMI6MmGFZrAvSfZbL2qnrht+OeeB98VzH11R@vger.kernel.org
X-Gm-Message-State: AFuF++nk88FdZr85oRbobVoq6gDDRzlBZyL3DYBfj3rwlPYfdTWaZXyZ
	wQqHwehAIea96oePgKqHw0aScBw4HgP7YQ7XMl/sVa42SAt4HGp78AbwL85JfEUY+7CaHlfRtIC
	4k/yIXNOZ9n8caNOYna5TTbG7PuBwFNmCjZsFzcAA1+lJRbIeBgZV7MO4pjwfTfBosq6TCJ0=
X-Gm-Gg: AYBFou20rbm1Y2LYGuGdaisalBfZMBWE9EmyHgMLnFz83r/Vm8NNr3/UAjAgio34yY6
	WR2bXoxOOi4fgCL5zVRVY9OWvh8QgXNnDDCOf/wiJF922UFZZHVvGqU1+OdIpRQ9EI2ImFPqbnq
	iWQWuB6Rhx/IBrULk3Kb7En/6KkhSs6G6YYkGUWQOBXtGBkTpccDe4OJZ5X6q/eE/RjF+6mwvG4
	+YyJo0wto/YbglT0dwjYDZYg2mWjEI+T9IVU790/4cKTzMJGc4toSxXDoPVTHGR37nUqwlk3E54
	9bmJicfdMfUHFdObUUYvzl6PbXmFxy1CerZcsi9pBTqySYKDh0tfogFeKqWXLSX0cLjsAioKjhN
	trWQEJl7iKTrcMwKWFOPUKFQ=
X-Received: by 2002:a05:600c:4684:b0:49c:fc6c:be14 with SMTP id 5b1f17b1804b1-49cfc6cc10bmr197561135e9.26.1788786813409;
        Mon, 07 Sep 2026 06:13:33 -0700 (PDT)
X-Received: by 2002:a05:600c:4684:b0:49c:fc6c:be14 with SMTP id 5b1f17b1804b1-49cfc6cc10bmr197560545e9.26.1788786812906;
        Mon, 07 Sep 2026 06:13:32 -0700 (PDT)
Received: from redhat.com (IGLD-80-230-79-236.inter.net.il. [80.230.79.236])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cfd3f8192sm270920615e9.3.2026.09.07.06.13.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 06:13:32 -0700 (PDT)
Date: Mon, 7 Sep 2026 09:13:28 -0400
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
	linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/3] virtio: synchronize callbacks during device reset
Message-ID: <20260907091033-mutt-send-email-mst@kernel.org>
References: <20260905152059.89560-1-kmehltretter@gmail.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260905152059.89560-1-kmehltretter@gmail.com>

On Sat, Sep 05, 2026 at 05:20:56PM +0200, Karl Mehltretter wrote:
> A virtqueue callback can outlive virtio_reset_device() and race with a
> driver freeing the state it uses. The reset helper documents that no
> callbacks remain in progress, but that depends on the transport:
> virtio-pci waits in vp_reset(), while virtio-mmio does not.
> 
> virtio_input has a related ordering problem: it unregisters the input
> device before resetting the virtio device, while an event callback may
> still be using the input device.
> 
> Patch 1 moves the callback wait into the core, using the existing
> virtio_synchronize_cbs() operation. Patch 2 fixes the virtio_input teardown
> order. Patch 3 adds the missing synchronize_cbs hooks for UML, TmFIFO,
> remoteproc and virtio-vdpa. Remoteproc uses one SRCU domain per processor.
> 
> The new hooks wait for callbacks already running. UML, TmFIFO and
> remoteproc still allow new callbacks after reset; fixing that is separate
> work. The event-virtqueue DMA mapping issue is also separate.
> 
> Changes in v2:
> - Patch 1: move the wait into the core instead of fixing only MMIO, as
>   Michael suggested. Remove the duplicate PCI wait, preserve its shutdown
>   wait, and fix CCW callback locking. Drop the MMIO polling: reset polling
>   for v3 and newer is already in fa8833c085b6 ("virtio-mmio: add support
>   for transport version 3").
> - Patch 2: keep draining completed events when ready becomes false,
>   instead of breaking out, so teardown does not truncate an input packet.
> - Patch 3 is new, at Michael's request.

got all 3 patches now. it's a good start, thanks, but they need
a bit more work, in particular addressing sashiko comments.
I'd also prefer patch 1 to be split: moving code from pci to core
is separate from ccw fixes.

Pls write or at least edit commit log messages yourself,
after reviewing Documentation/process/coding-assistants.rst

Thanks a lot!


> I reran the 120-cycle unbind/rebind test in an arm64 KASAN guest with four
> vCPUs and a 5 ms busy delay per event. With patch 2 alone over virtio-mmio,
> reset returned with the callback still running in all 84 overlapping
> cycles. With the series, it waited in all 103. Over PCI with per-queue
> MSI-X, it waited in all 66, including runs with threadirqs. No KASAN or
> lockdep reports. These runs predate the per-rproc change, which leaves
> the tested MMIO and PCI paths unchanged. They confirmed the missing wait,
> but did not reproduce a use-after-free: with evdev attached,
> input_unregister_device() waits for an RCU grace period that the IRQ
> callback blocks.
> 
> That version also passed QEMU input, rebind and shutdown checks on arm64
> MMIO and x86-64 PCI, including arm64 RT, KASAN and KCSAN builds, and x86
> UP/Tiny SRCU. A legacy INTx NIC was present for an additional x86
> shutdown check. The changed objects built with W=1 without warnings on
> arm64, x86-64, s390 and SMP UML. The per-rproc version built with W=1
> on arm64 KASAN and x86 Tiny SRCU, and passed six remoteproc callback and
> lifetime KUnit tests on each, using mock remoteproc devices.
> 
> Link: https://lore.kernel.org/r/20260818040433.66986-1-kmehltretter@gmail.com
> 
> Karl Mehltretter (3):
>   virtio: synchronize callbacks during device reset
>   virtio_input: stop callbacks before unregistering input device
>   virtio: implement synchronize_cbs for remaining transports
> 
>  arch/um/drivers/virtio_uml.c             | 10 ++++++++++
>  drivers/platform/mellanox/mlxbf-tmfifo.c | 14 ++++++++++++++
>  drivers/remoteproc/remoteproc_core.c     | 10 ++++++++++
>  drivers/remoteproc/remoteproc_virtio.c   | 20 +++++++++++++++++---
>  drivers/s390/virtio/virtio_ccw.c         |  6 +-----
>  drivers/virtio/virtio.c                  |  2 ++
>  drivers/virtio/virtio_input.c            |  8 ++++++--
>  drivers/virtio/virtio_pci_legacy.c       |  2 --
>  drivers/virtio/virtio_pci_modern.c       |  3 ---
>  drivers/virtio/virtio_vdpa.c             | 21 ++++++++++++++++++++-
>  include/linux/remoteproc.h               |  3 +++
>  include/linux/virtio_config.h            |  6 +++---
>  12 files changed, 86 insertions(+), 19 deletions(-)
> 
> base-commit: a500db7819c50db59e55f1b4fa1c3baa5a2616f3
> -- 
> 2.39.5 (Apple Git-154)

