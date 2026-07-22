Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DBBC369D5D
	for <linux-remoteproc@vger.kernel.org>; Wed, 22 Jul 2026 14:49:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784731792; cv=none; b=n/yLGCeP3R3qaeJ/s2oWdfOiwoZ72BmcftXd2djlsC+vx6I53gf3qUBdqtCtVOdSfJ7s3YNYU2jSwnbNMrBRSbbdlpHBlSJW+gCQlv40nAEbjS3EZAdZ72EBxTzAGB4vQ9syOa1L957FfuEfXc8jb9yekFZh+hISVgEkpes0ObQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784731792; c=relaxed/simple;
	bh=FRw3L2TolAFwQfgd99bn9X5rZKhPPZ+brWSdo6BpVLA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VDSqwt/Xuro1EC6Liqswkh9YE+GhuNfcNzW8VvWx138TnX618hc1X260NL3M77Xy+KKf6omP2cKKIyBEnUKe2Ln1EdTYnItXTmj7b4LKER1Ebm/5tPuNfuMgnemhebmZoh/hcp5bq8T8FHUTS/AWdVwnHULgYcZn9OMJm4ZQm+M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ptawoV4K; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ptawoV4K"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-84862b0d5f8so7543042b3a.3
        for <linux-remoteproc@vger.kernel.org>; Wed, 22 Jul 2026 07:49:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1784731790; x=1785336590; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=zSdvhGvgLhUhnHE4OmhWyoNK/rsRW9LOiDp1/0CytrQ=;
        b=ptawoV4KzpCFek8pAS5EjT/DiDccef6jAnjdyjT9W8wkryDrY2j+KXk8Ly/35N2u3q
         2T+Cl28AyXCjJOFdbgLC8sdcKkjrdX7VIGF1xvoAx37aTvas/Lrvf26Wmfcf8hW0aEO5
         317XeXErrcHEKSyFf2ChQhIYu18w0LRJkGD6ZqOYG8wYTuGkwJM8J6j/saIYrn6y2RGW
         Epdy6qZebftQfIHud/ZziWqOYWbdqB8LbfndigR7ZmFr1rdmcC4TPF89O05M9UU+cP7f
         Hfl+tAse5myW9geomXqoiT/tkzNucAaC5gM50LARvHmWrBxuMjXZQY9sPtL2gpzpWZdX
         GKvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784731790; x=1785336590;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zSdvhGvgLhUhnHE4OmhWyoNK/rsRW9LOiDp1/0CytrQ=;
        b=gHBQnqx9RjUuzAjjJcePtTFH0zZLXXjV8V/PMZ2Kt2iaq3DhlSdRUT7yGs6rhO7wJf
         P+AeneFggHfwQiE6xqUQjFOyG6hBPVa8pULyY0qGU4BB01ufmQ1WxlecfucurAKRLloc
         wNfgIBLb1A7B6iaY/kl4LzzxXqvI7LRxyg/qaGJfiZf8z1/93AZWVTJBwN7+QCCP7sS9
         uHu/GuxEpWT913oF1dcBVIBEPV+Ts397jB4X3PPh7QKvKIq1v0zeFOkPAqoPJzX5czdB
         b2k9YBD0kGfb6HvsMLnValGoWluNXKHWZDi6QWqcK+M4PoSlFvR4t9z0u+xy5MQU188B
         IJ3w==
X-Forwarded-Encrypted: i=1; AHgh+Rq38wrA7yFhSICR7S1fIduewfS2d6vfUs2dPfM8UQZjJvlgEQEP4J8lNalChtY4iXpuXist9GHQELQ3PqdnYYV2@vger.kernel.org
X-Gm-Message-State: AOJu0YygjS1v9GdIuVP9PR1eKmGWZmMQ/UQMhZTOZElwH9trUvFI3hXJ
	Lq6AndtWUG+xhB8BMAo72jnJ41pmeGqRhkw2CIFUceReNyul2p3ZNd7o16AKRdRtKeE=
X-Gm-Gg: AR+sD13RPUAYx9rj0taY44FFee8ODwH7gG2JdBRk5muJ/HMPnW35BC2UYuon3IpXtLN
	022xOAKtHDl2QKONgKA0Ifqejb3s07tPDI3VgRnPnBImDD8KFzCu1g3Rczh5d9trumTJITut6WX
	hcqD9IcnLS6KIu4q6lXoo9EFQkGuqQZ+iPOuDJ/na0jY6/Ll0xB06xLnaz4Gwn5+xDzpIPupMHX
	zNHXruUTTDrjwISCLcZ9w+DuTFhdQzYqXnCQ6cTIOpnY76C8A66jKDzLx7FqMfwh3jjT0Uw8WF7
	ZT6klRucEoc0XMs8xQcEsFAkUZkFzPyVeJ5Ng1ORhwGVx93G1RAqIsNnvQwoJpuptHmY0yzphyl
	HND8FBjVINFbKaYCjE7cxcT7+hk3+L4p7AzB2okf3QuTwyVKujWbku6whQzbcIlwEgbnrLJ10gS
	ql5S1rBA==
X-Received: by 2002:a05:6a00:3a2a:b0:845:e04b:565f with SMTP id d2e1a72fcca58-84c292634e4mr24038102b3a.14.1784731790039;
        Wed, 22 Jul 2026 07:49:50 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:ffc8:5f3a:2bec:f5de])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84e1760025esm1494629b3a.57.2026.07.22.07.49.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 07:49:49 -0700 (PDT)
Date: Wed, 22 Jul 2026 08:49:47 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: tanmay.shah@amd.com
Cc: andersson@kernel.org, corbet@lwn.net, skhan@linuxfoundation.org,
	linux-remoteproc@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 3/5] rpmsg: virtio_rpmsg_bus: get buffer size from
 config space
Message-ID: <amDYiyTFFLkkTv5K@p14s>
References: <20260710192831.3440427-1-tanmay.shah@amd.com>
 <20260710192831.3440427-4-tanmay.shah@amd.com>
 <ale0KIu6hXNvN0q9@p14s>
 <66e4a85c-be14-4bd8-8328-bf17d2437994@amd.com>
 <CANLsYkyL8_YSb39QqbC0Z+udahMtCV1e+OeoKGvmGSxQ6h3_qA@mail.gmail.com>
 <c8f62152-fb7b-4771-87d7-9420c7e3f452@amd.com>
 <al-VRUCcl6NWzQkY@p14s>
 <a37bb772-2b27-44fa-9bf1-30707c419141@amd.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a37bb772-2b27-44fa-9bf1-30707c419141@amd.com>

On Tue, Jul 21, 2026 at 11:02:13AM -0500, Shah, Tanmay wrote:
> 
> 
> On 7/21/2026 10:50 AM, Mathieu Poirier wrote:
> > On Thu, Jul 16, 2026 at 11:12:55AM -0500, Shah, Tanmay wrote:
> >>
> >>
> >> On 7/16/2026 10:48 AM, Mathieu Poirier wrote:
> >>> On Wed, 15 Jul 2026 at 11:28, Shah, Tanmay <tanmays@amd.com> wrote:
> >>>>
> >>>> Hi,
> >>>>
> >>>> Please find my response below:
> >>>>
> >>>> On 7/15/2026 11:24 AM, Mathieu Poirier wrote:
> >>>>> On Fri, Jul 10, 2026 at 12:28:29PM -0700, Tanmay Shah wrote:
> >>>>>> 512 bytes isn't always suitable for all case, let firmware
> >>>>>> maker decide the best value from resource table.
> >>>>>> enable by VIRTIO_RPMSG_F_BUFSZ feature bit.
> >>>>>>
> >>>>>> Signed-off-by: Tanmay Shah <tanmay.shah@amd.com>
> >>>>>> ---
> >>>>>> Changes in v5:
> >>>>>>
> >>>>>>   - fix documentation about alignment of the buffer size
> >>>>>>   - change version field from u16 to u8
> >>>>>>   - remove buffer alignment check
> >>>>>>   - Separate buffer alignment vs MTU of a single buffer
> >>>>>>   - Use buffer alignment only to get next buffer address at alignment
> >>>>>>     boundary
> >>>>>>
> >>>>
> >>>> [...]
> >>>>
> >>>>>> +#ifndef _LINUX_VIRTIO_RPMSG_H
> >>>>>> +#define _LINUX_VIRTIO_RPMSG_H
> >>>>>> +
> >>>>>> +#include <linux/types.h>
> >>>>>> +#include <linux/virtio_types.h>
> >>>>>> +
> >>>>>> +/* The feature bitmap for virtio rpmsg */
> >>>>>> +#define VIRTIO_RPMSG_F_NS   0 /* RP supports name service notifications */
> >>>>>> +#define VIRTIO_RPMSG_F_BUFSZ        1 /* RP get buffer size from config space */
> >>>>>> +
> >>>>>> +/* Version of struct virtio_rpmsg_config understood by this driver */
> >>>>>> +#define RPMSG_VDEV_CONFIG_V1        1
> >>>>>> +
> >>>>>> +/**
> >>>>>> + * struct virtio_rpmsg_config - config space for rpmsg virtio device
> >>>>>> + *
> >>>>>> + * @version:        version of this structure, currently %RPMSG_VDEV_CONFIG_V1.
> >>>>>> + * @size:   size of this structure in bytes.
> >>>>>> + * @rpmsg_buf_align: alignment in bytes for each buffer. Must be a power of
> >>>>>> + *               two. If 0 then no alignment will be done. This alignment
> >>>>>> + *               will not decide actual size of the buffer but will be
> >>>>>> + *               used to decided the start address of the buffer. The
> >>>>>> + *               actual size of the buffer can be different than the
> >>>>>> + *               aligned size of the buffer.
> >>>>>
> >>>>> Is there really a need to have a buffer size different from its alignment?  It's
> >>>>> not like the (small) delta between the buffer size and its alignment will be
> >>>>> used for something else.  I'm fine with a buffer alignment requirement but in
> >>>>> those cases, the firmware should set the size of the buffer in accordance with
> >>>>> its alignment requirement.  Otherwise, the complexity needed to manage the
> >>>>> discrpancy between the two yields a driver that is hard to maintain and prone to
> >>>>> bugs.
> >>>>>
> >>>>
> >>>> I had the same concern before. However, following example changed my mind:
> >>>>
> >>>> So, a single buffer size is the MTU size of a packet for the protocol
> >>>> supported by the firmware. Now that can be different than the aligned
> >>>> size of the buffer.
> >>>>
> >>>> For example, the higher level protocol (not rpmsg) has 430 bytes as the
> >>>> max size of a payload. However, cache line alignment is 64-bytes. Then
> >>>> in that case, the aligned buffer size is 448 bytes. But, that doesn't
> >>>> mean we can say protocol's MTU size is 448 bytes. If user end up
> >>>> treating MTU size 448 bytes and use space beyond 430 bytes, then the
> >>>> higher level apps might discard that data and communication may fail.
> >>>>
> >>>
> >>> How is that scenario different from today's 512 byte buffer size?
> >>> Most users don't use all 512 bytes and we don't run in the problem
> >>> described above?
> >>>
> >>
> >> 512 buffer size is hardcoded, so it is enforced on the protocol by the
> >> framework. But by allowing the configuration of the buffer size we are
> >> allowing the protocol to decide what the buffer size should be. So, when
> >> user request the buffer via rpmsg_get_mtu() API, then that should be the
> >> original buffer size which is expected by the protocol, which may not be
> >> same as the aligned buffer size.
> > 
> > Regardless of the buffer size, whether it is set to 512 byte or some arbitrary
> > value by the remote processsor's firmware, there is a possibility of a
> > discrepancy with what is expected by the protocol.  Right now rpmsg_get_mtu()
> > returns 512 regardless of what a protocol uses.  The only thing that should be
> > important to the protocol is not to exceed that limit.
> > 
> 
> I think I am missing something. Are you saying that buffer size can not
> be configured greater than 512 bytes?

I am not.

What I am saying is that if alignment is important to a remote processor, it
should choose the buffer size accordingly.  rpmsg_get_mtu() should return the
value of the buffer size, exactly the way it is today. 

> 
> If the higher level protocol (not RPMsg) wants to use 4030 bytes for
> single packet payload then that is what the MTU size should be. And so
> the firmware will configure 4030 bytes as single buffer size in the vdev
> config space. That is why alignment should be treated separately.
> Because it is not equal to payload size needed by higher level protocol.

In that case and assuming alignment is required, the buffer size should be 4096
and rpmsg_get_mtu() should also return 4096.  How a higher protocol uses the
buffer space is none of our concern.

Currently, the buffer size is set to 512 and users don't always fill the entire
buffer.  I don't see why things should be different with a configurable buffer
size.   

> 
> >>
> >> If for internal management we want to treat buffer size = aligned buffer
> >> size, I am okay. But rpmsg_get_mtu() must give unaligned buffer size
> >> which is expected by the protocol.
> > 
> > I agree with the first sentence but not the second.  The only thing protocols
> > should care about is the start address of a buffer and that its size is
> > sufficient for what it needs.
> > 
> >>
> >> Thanks,
> >> Tanmay
> >>
> >>>> The alignment field is used only to decide where the next buffer start
> >>>> address is to ease cache operations.
> >>>>
> >>>> Sure, we need to maintain this complexity, but I think it's worth it.
> >>>>
> >>>
> >>> The same as in my previous email to Arnaud applies here - is this an
> >>> immediate requirement of something we think may be happening in the
> >>> future?
> >>>
> >>
> >> IMHO, vendors will use it if the feature is available, otherwise the
> >> need to optimize alignment is not easily encountered.
> >>
> >>>
> >>>> Thanks,
> >>>> Tanmay
> >>>>
> >>>>>> + * @txbuf_size:     Tx buf size from remote's view. For Linux this is rx buf size.
> >>>>>> + * @rxbuf_size:     Rx buf size from remote's view. For Linux this is tx buf size.
> >>>>>> + *
> >>>>>> + * This is the configuration structure shared by the device and the driver,
> >>>>>> + * read when %VIRTIO_RPMSG_F_BUFSZ is negotiated. The fields are laid out so
> >>>>>> + * the structure is naturally 32-bit aligned.
> >>>>>> + */
> >>>>>> +struct virtio_rpmsg_config {
> >>>>>> +    u8 version;
> >>>>>> +    __virtio16 size;
> >>>>>> +    __virtio16 rpmsg_buf_align;
> >>>>>> +    /* The tx/rx individual buffer size (if VIRTIO_RPMSG_F_BUFSZ) */
> >>>>>> +    __virtio32 txbuf_size;
> >>>>>> +    __virtio32 rxbuf_size;
> >>>>>> +} __packed;
> >>>>>> +
> >>>>>> +#endif /* _LINUX_VIRTIO_RPMSG_H */
> >>>>>> --
> >>>>>> 2.34.1
> >>>>>>
> >>>>
> >>
> 
