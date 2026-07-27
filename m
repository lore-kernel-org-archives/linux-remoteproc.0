Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D733274650
	for <linux-remoteproc@vger.kernel.org>; Mon, 27 Jul 2026 15:21:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785165673; cv=pass; b=jaBRBg8R8YBNkzL2XOMzYDxhjR68afvHv1nE85Azcp7GI9qaV94eHihISmGT1vdQEOZ64T52aws5WYSs7INUB3MvrmgrD7iNlbZly5JYpF3NBhTuzmNoAp51ziiv5PDejNF7tjPT1bs4NLfo7ehPSyL6wa5ybyFLnwrsuJ/uNyA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785165673; c=relaxed/simple;
	bh=/MyeQZTPn9rqkxo6YksbS3ehh9oYYrIsrAXL5FVnJIY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GwMs0NfR1k01gqLcSaLvgnBndyUbQQ7zWF0w3YG0C3tRWc4OxCtxRg0qva0eRwU4mbKcnYYdAWScBFLkjCTSadPtwEX/ZNXrQ2zilR4zhAFiLgx/VfYmQJHevEgDT8KpBNQeKI9h7RhhhYVI8UGdzh2GKYvb7Qr7MOqSw7nKw8A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=tpaZKS9F; arc=pass smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="tpaZKS9F"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-69fc856b00eso1908199a12.2
        for <linux-remoteproc@vger.kernel.org>; Mon, 27 Jul 2026 08:21:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785165670; cv=none;
        d=google.com; s=arc-20260327;
        b=hkbShGeVxZVVn7CtriFMucr5z+urAJpb9i5cUB0V6lDeu48aaflyMCFPM43snAckfM
         kSTHLi6EnZRpbN6RnqrCAZwOnOogWCna8Lt7yaGVJvRDQxZ1lzgNqAhmSzjwBwrcI++0
         T09LjzeNJBzgaMJ4QznNotpf72Mh99aCSipSwwXLmoVj0az80e3INcFNPOQIRoFfzm4t
         47eAubf5TnQz2yrecWjDctTfSfVQ0Kivi8ZgcdDNXxQD/MQ0VAfFL2Z5EwKISEXo9ybQ
         uj3J0+1XLdFhcwHVTFUndqMJywdDPYX6dIjdmnMnpLFE9THfizt2CUedgjMabBAvmjVd
         AH0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Xw17qJ8XaEeGNUn2onPVjFXBaQvAU90nz3gqoKlKAuQ=;
        fh=Z2O0rEaeW5BjsDNviw6ksKxUoxH4XmFJ5ktjSKE7Ap4=;
        b=qIRak5TOcRtq3gtaeONeksJlsiNRwLUCx6vdyDm9fYzEkK+CtrMbaVt/wp+BthxzAp
         LE00XJ0S8UEcunpjK4FTKOdw8l+a4Fr2D13ks2GEkFsSTIdANh6fEXAPil2cBzSD5XRi
         vbk6O1of7dXNJvVf7JfNw8K0B136si0qMA5JXT74zoX8oktcppBfn5dBCcbvYoHdAmvg
         Z96seI988GAdWuc0oC+cBGD/iWR8bIs8mMZJArlvHInOxEUXoNo+05g+Mm4qBNwS3VGU
         sHEXR1NIYA7Picb37iMksokFqAKOHyBWblZON/bMZ+jpzfP4asQHxDVrC7h9umD9XJ19
         JkWA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1785165670; x=1785770470; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Xw17qJ8XaEeGNUn2onPVjFXBaQvAU90nz3gqoKlKAuQ=;
        b=tpaZKS9FJbVuB4MFBlXg8c/mOBRFCNqV7EIO7qs/TiQDmnZ2hedU9SIbWlktXLP0ZB
         mciKUdOGe1Rs7IpL+UWKXQV100Gir36uwHqhlFm1Oq2/cOVYowRCMiOrOqK+f4e9KXB7
         E00oDPZSQYJ0pnu45dafh/K0Gko/a/RF37D0F0ltlmAubXO+SX5/H2tLy3bUncj4i5Cz
         XKepSbN4gLPDYtc2TThdRZu90EtEFeGh+J0foGjCHyzZTzPDPtvEHf1gRBkjeMfdj+SN
         swyWD4S1iY69Fz7gXih590VM3iEF95+rifAtciPLSuzUomfvhMoJpB/XLUZENi/NcWC5
         fdeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785165670; x=1785770470;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Xw17qJ8XaEeGNUn2onPVjFXBaQvAU90nz3gqoKlKAuQ=;
        b=ZHq0wQDcCuZcpLWVUun0cSJwtwyhGUq/zIuwWDS5IB69oamu7HejqOyAJoQoa8/1Wl
         HYIbMZs1sIkoyzEgJ6f9y4RI+pj9iXuugz4Uag+yokKyS7lKgBRfRCBtM3D/87DcMd0B
         D686ALZweuHyYTCz0EXxNArl5Z4jOJ595+IhcKOK4PmvRydO/fSP7vPy0UVvN6snA0Z1
         ltRm1LqqF/9Gh5AJUBU2Y7/wdca/neFymGbLwTmN/6BMp8cD2YkhxXU0uVcDF5wdfZuT
         WJv/fDjYUvlyltyA5lIpnjsj/oCHAT1sO2eg3LmVMTiZLYb0fcdQYbDEslsbzzxAH7tO
         0/cQ==
X-Forwarded-Encrypted: i=1; AHgh+RoMy63Ds+6BHKxi0zhLtEkHxYzRAq0NnR/bQj6z9TQ+X7yfeyYMmoCTGRunNg+QLDKONfoFd+jRvDcu/mgbDJIF@vger.kernel.org
X-Gm-Message-State: AOJu0YxR6aEkGYedjMGNqknBkCj5aJva+6XpGT47W21d6NQBONYISlC5
	OE9RXdu2MlBWXtyY99rwFVYf0ME0AbQ062C7K6DH0EKtm+xkJlh0aKBkr/jOG+Shush2UHavYiN
	Yc6KclJ+EX6FvJ1tvI+Zj6shjBPvWB8jNs59unD49Mw==
X-Gm-Gg: AR+sD134j1EqTui51NP4gOeiRtVU3ENGcJeDvZVOpNs9npIdirdOTxfdIYBaLU3spq0
	+X36uWpQN4BdRPYKsKEPlZkFjL0dBZB72Kez95ffwwdl3FYqxJZL4HWjgxSt9hGg0zheWub2xnF
	Nj71l0tVV4ejZY6L0GXFu6Aap8iSvRARAbkHu2kKlXRd9vPvDlTo6S56TGuFByH2Rx22U0h5Fgc
	JImQQ/HSUmhw8sAMohYuA+xKLGFu3RCqOTXeF2lOu/ojBXXzsCw/n8sa04couwa2HzuTvwK87/P
	z40xfN0tjCRNyVmVL7Mvcq+vkDH0+iHucIKtwDG9Ow==
X-Received: by 2002:a05:6402:1952:b0:69a:928:9405 with SMTP id
 4fb4d7f45d1cf-69fc1005547mr3034620a12.1.1785165669574; Mon, 27 Jul 2026
 08:21:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260710192831.3440427-1-tanmay.shah@amd.com> <20260710192831.3440427-4-tanmay.shah@amd.com>
 <ale0KIu6hXNvN0q9@p14s> <66e4a85c-be14-4bd8-8328-bf17d2437994@amd.com>
 <CANLsYkyL8_YSb39QqbC0Z+udahMtCV1e+OeoKGvmGSxQ6h3_qA@mail.gmail.com>
 <c8f62152-fb7b-4771-87d7-9420c7e3f452@amd.com> <al-VRUCcl6NWzQkY@p14s>
 <a37bb772-2b27-44fa-9bf1-30707c419141@amd.com> <amDYiyTFFLkkTv5K@p14s>
 <c1d24c44-8daf-48bc-9785-7ab394353356@foss.st.com> <CANLsYkzCKpNG-2W24EA1FEjEEr1J+w6VvM=sPwr8wMRDNqm9jg@mail.gmail.com>
 <c6826750-03b3-4ad6-9f88-394b0234ec27@foss.st.com>
In-Reply-To: <c6826750-03b3-4ad6-9f88-394b0234ec27@foss.st.com>
From: Mathieu Poirier <mathieu.poirier@linaro.org>
Date: Mon, 27 Jul 2026 09:20:57 -0600
X-Gm-Features: AUfX_mx_B10CZKJVNoJ6q2Tww_rqrD0rR5l2TP4HV73BfkhlTfpU2Fxq4zX04vc
Message-ID: <CANLsYkzaEWRSNndLg8yj9kPiYE8Ys0Ps7EhO=q+ESrF49+MB4A@mail.gmail.com>
Subject: Re: [PATCH v5 3/5] rpmsg: virtio_rpmsg_bus: get buffer size from
 config space
To: Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>
Cc: tanmay.shah@amd.com, andersson@kernel.org, corbet@lwn.net, 
	skhan@linuxfoundation.org, linux-remoteproc@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 23 Jul 2026 at 11:27, Arnaud POULIQUEN
<arnaud.pouliquen@foss.st.com> wrote:
>
>
>
> On 7/23/26 16:13, Mathieu Poirier wrote:
> > On Thu, 23 Jul 2026 at 03:11, Arnaud POULIQUEN
> > <arnaud.pouliquen@foss.st.com> wrote:
> >>
> >> Hello Mathieu,
> >>
> >> On 7/22/26 16:49, Mathieu Poirier wrote:
> >>> On Tue, Jul 21, 2026 at 11:02:13AM -0500, Shah, Tanmay wrote:
> >>>>
> >>>>
> >>>> On 7/21/2026 10:50 AM, Mathieu Poirier wrote:
> >>>>> On Thu, Jul 16, 2026 at 11:12:55AM -0500, Shah, Tanmay wrote:
> >>>>>>
> >>>>>>
> >>>>>> On 7/16/2026 10:48 AM, Mathieu Poirier wrote:
> >>>>>>> On Wed, 15 Jul 2026 at 11:28, Shah, Tanmay <tanmays@amd.com> wrot=
e:
> >>>>>>>>
> >>>>>>>> Hi,
> >>>>>>>>
> >>>>>>>> Please find my response below:
> >>>>>>>>
> >>>>>>>> On 7/15/2026 11:24 AM, Mathieu Poirier wrote:
> >>>>>>>>> On Fri, Jul 10, 2026 at 12:28:29PM -0700, Tanmay Shah wrote:
> >>>>>>>>>> 512 bytes isn't always suitable for all case, let firmware
> >>>>>>>>>> maker decide the best value from resource table.
> >>>>>>>>>> enable by VIRTIO_RPMSG_F_BUFSZ feature bit.
> >>>>>>>>>>
> >>>>>>>>>> Signed-off-by: Tanmay Shah <tanmay.shah@amd.com>
> >>>>>>>>>> ---
> >>>>>>>>>> Changes in v5:
> >>>>>>>>>>
> >>>>>>>>>>     - fix documentation about alignment of the buffer size
> >>>>>>>>>>     - change version field from u16 to u8
> >>>>>>>>>>     - remove buffer alignment check
> >>>>>>>>>>     - Separate buffer alignment vs MTU of a single buffer
> >>>>>>>>>>     - Use buffer alignment only to get next buffer address at =
alignment
> >>>>>>>>>>       boundary
> >>>>>>>>>>
> >>>>>>>>
> >>>>>>>> [...]
> >>>>>>>>
> >>>>>>>>>> +#ifndef _LINUX_VIRTIO_RPMSG_H
> >>>>>>>>>> +#define _LINUX_VIRTIO_RPMSG_H
> >>>>>>>>>> +
> >>>>>>>>>> +#include <linux/types.h>
> >>>>>>>>>> +#include <linux/virtio_types.h>
> >>>>>>>>>> +
> >>>>>>>>>> +/* The feature bitmap for virtio rpmsg */
> >>>>>>>>>> +#define VIRTIO_RPMSG_F_NS   0 /* RP supports name service not=
ifications */
> >>>>>>>>>> +#define VIRTIO_RPMSG_F_BUFSZ        1 /* RP get buffer size f=
rom config space */
> >>>>>>>>>> +
> >>>>>>>>>> +/* Version of struct virtio_rpmsg_config understood by this d=
river */
> >>>>>>>>>> +#define RPMSG_VDEV_CONFIG_V1        1
> >>>>>>>>>> +
> >>>>>>>>>> +/**
> >>>>>>>>>> + * struct virtio_rpmsg_config - config space for rpmsg virtio=
 device
> >>>>>>>>>> + *
> >>>>>>>>>> + * @version:        version of this structure, currently %RPM=
SG_VDEV_CONFIG_V1.
> >>>>>>>>>> + * @size:   size of this structure in bytes.
> >>>>>>>>>> + * @rpmsg_buf_align: alignment in bytes for each buffer. Must=
 be a power of
> >>>>>>>>>> + *               two. If 0 then no alignment will be done. Th=
is alignment
> >>>>>>>>>> + *               will not decide actual size of the buffer bu=
t will be
> >>>>>>>>>> + *               used to decided the start address of the buf=
fer. The
> >>>>>>>>>> + *               actual size of the buffer can be different t=
han the
> >>>>>>>>>> + *               aligned size of the buffer.
> >>>>>>>>>
> >>>>>>>>> Is there really a need to have a buffer size different from its=
 alignment?  It's
> >>>>>>>>> not like the (small) delta between the buffer size and its alig=
nment will be
> >>>>>>>>> used for something else.  I'm fine with a buffer alignment requ=
irement but in
> >>>>>>>>> those cases, the firmware should set the size of the buffer in =
accordance with
> >>>>>>>>> its alignment requirement.  Otherwise, the complexity needed to=
 manage the
> >>>>>>>>> discrpancy between the two yields a driver that is hard to main=
tain and prone to
> >>>>>>>>> bugs.
> >>>>>>>>>
> >>>>>>>>
> >>>>>>>> I had the same concern before. However, following example change=
d my mind:
> >>>>>>>>
> >>>>>>>> So, a single buffer size is the MTU size of a packet for the pro=
tocol
> >>>>>>>> supported by the firmware. Now that can be different than the al=
igned
> >>>>>>>> size of the buffer.
> >>>>>>>>
> >>>>>>>> For example, the higher level protocol (not rpmsg) has 430 bytes=
 as the
> >>>>>>>> max size of a payload. However, cache line alignment is 64-bytes=
. Then
> >>>>>>>> in that case, the aligned buffer size is 448 bytes. But, that do=
esn't
> >>>>>>>> mean we can say protocol's MTU size is 448 bytes. If user end up
> >>>>>>>> treating MTU size 448 bytes and use space beyond 430 bytes, then=
 the
> >>>>>>>> higher level apps might discard that data and communication may =
fail.
> >>>>>>>>
> >>>>>>>
> >>>>>>> How is that scenario different from today's 512 byte buffer size?
> >>>>>>> Most users don't use all 512 bytes and we don't run in the proble=
m
> >>>>>>> described above?
> >>>>>>>
> >>>>>>
> >>>>>> 512 buffer size is hardcoded, so it is enforced on the protocol by=
 the
> >>>>>> framework. But by allowing the configuration of the buffer size we=
 are
> >>>>>> allowing the protocol to decide what the buffer size should be. So=
, when
> >>>>>> user request the buffer via rpmsg_get_mtu() API, then that should =
be the
> >>>>>> original buffer size which is expected by the protocol, which may =
not be
> >>>>>> same as the aligned buffer size.
> >>>>>
> >>>>> Regardless of the buffer size, whether it is set to 512 byte or som=
e arbitrary
> >>>>> value by the remote processsor's firmware, there is a possibility o=
f a
> >>>>> discrepancy with what is expected by the protocol.  Right now rpmsg=
_get_mtu()
> >>>>> returns 512 regardless of what a protocol uses.  The only thing tha=
t should be
> >>>>> important to the protocol is not to exceed that limit.
> >>>>>
> >>>>
> >>>> I think I am missing something. Are you saying that buffer size can =
not
> >>>> be configured greater than 512 bytes?
> >>>
> >>> I am not.
> >>>
> >>> What I am saying is that if alignment is important to a remote proces=
sor, it
> >>> should choose the buffer size accordingly.  rpmsg_get_mtu() should re=
turn the
> >>> value of the buffer size, exactly the way it is today.
> >>
> >> Did you get a chance to look to my previous reply [1]?
> >>
> >
> > Unfortunately I haven't had the opportunity to reach that point in my I=
nbox.
> >
> >>   From my understanding, due to the Virtio specification, we cannot
> >> guarantee that
> >> the buffer size will not be updated by the main processor. Having an
> >> alignment
> >> field ensures that the main processor takes the remote processor=E2=80=
=99s
> >> constraints
> >> into account if it updates the RPMsg buffer size.
> >>
> >
> > Where does the main processor change the buffer size?
>
> Linux does not, but any main processor may do so, consistent with the
> Virtio specification. If requested in OpenAMP with a valid usecase, no
> reason to reject if it is not specified that it is not possible.

"Linux does not" - that is the important part.  This patchset is for
Linux and RPMSG is part of the Linux code base.

>
> What we define here will probably become the reference for all RPMsg
> implementations...
>
> >
> >> That said, if we decide to remove the alignment field, we must clearly
> >> document the constraints for the RPMsg Virtio config space:
> >>
> >> - virtio_rpmsg_config cannot be changed by the Virtio driver.
> >> - the sizes must respect the device and driver alignment constraint.
> >>
> >
> > If the size chosen by the device isn't compatible with what the driver
> > can accommodate, then initialization simply fails.
> >
> >> This is not my preferred solution,because that means that the remote
> >> processor has
> >> to know the alignment constraints of the main processor.
> >>
> >
> > It would have to anyway wouldn't it?
>
> I think I was wrong about this last argument. Since the main processor
> allocates the buffers, it can apply its own alignment constraints,so the
> remote processor does not need to know them.
>
> That makes the option without an alignment field acceptable to me,
> if restrictions are documented.
>
> Here are the constraints that I would like to see documented (not
> necessary using the exact terms) in Linux and OpenAMP to make the usage
> clear for the RPMsg virtio config space:
> - The virtio driver must not update the config space.

Currently, there is no chance of that happening in Linux.

> - The virtio driver can allocate a memory area equal to or greater than
>    the RX/TX message size specified by the device. The effective RX/TX si=
ze
>    remains the one requested by the device.

Although hidden by the memory allocation API, this is often the case in Lin=
ux.

> - The virtio device should specify sizes that respect its own alignment
>    constraints.
>

Yes, that has been my position.

> Does this would be acceptable to you?
> Regards,
> Arnaud
>
> >
> >   And as I said from the beginning, this is not something that has come
> > up in the 20 years this subsystem existed.  There is no point in
> > adding all this complexity for a something that _may_ happen.
> >
> >> [1]https://www.mail-archive.com/linux-kernel@vger.kernel.org/msg264339=
8.html
> >>
> >> Regards,
> >>
> >> Arnaud
> >>>
> >>>>
> >>>> If the higher level protocol (not RPMsg) wants to use 4030 bytes for
> >>>> single packet payload then that is what the MTU size should be. And =
so
> >>>> the firmware will configure 4030 bytes as single buffer size in the =
vdev
> >>>> config space. That is why alignment should be treated separately.
> >>>> Because it is not equal to payload size needed by higher level proto=
col.
> >>>
> >>> In that case and assuming alignment is required, the buffer size shou=
ld be 4096
> >>> and rpmsg_get_mtu() should also return 4096.  How a higher protocol u=
ses the
> >>> buffer space is none of our concern.
> >>>
> >>> Currently, the buffer size is set to 512 and users don't always fill =
the entire
> >>> buffer.  I don't see why things should be different with a configurab=
le buffer
> >>> size.
> >>>
> >>>>
> >>>>>>
> >>>>>> If for internal management we want to treat buffer size =3D aligne=
d buffer
> >>>>>> size, I am okay. But rpmsg_get_mtu() must give unaligned buffer si=
ze
> >>>>>> which is expected by the protocol.
> >>>>>
> >>>>> I agree with the first sentence but not the second.  The only thing=
 protocols
> >>>>> should care about is the start address of a buffer and that its siz=
e is
> >>>>> sufficient for what it needs.
> >>>>>
> >>>>>>
> >>>>>> Thanks,
> >>>>>> Tanmay
> >>>>>>
> >>>>>>>> The alignment field is used only to decide where the next buffer=
 start
> >>>>>>>> address is to ease cache operations.
> >>>>>>>>
> >>>>>>>> Sure, we need to maintain this complexity, but I think it's wort=
h it.
> >>>>>>>>
> >>>>>>>
> >>>>>>> The same as in my previous email to Arnaud applies here - is this=
 an
> >>>>>>> immediate requirement of something we think may be happening in t=
he
> >>>>>>> future?
> >>>>>>>
> >>>>>>
> >>>>>> IMHO, vendors will use it if the feature is available, otherwise t=
he
> >>>>>> need to optimize alignment is not easily encountered.
> >>>>>>
> >>>>>>>
> >>>>>>>> Thanks,
> >>>>>>>> Tanmay
> >>>>>>>>
> >>>>>>>>>> + * @txbuf_size:     Tx buf size from remote's view. For Linux=
 this is rx buf size.
> >>>>>>>>>> + * @rxbuf_size:     Rx buf size from remote's view. For Linux=
 this is tx buf size.
> >>>>>>>>>> + *
> >>>>>>>>>> + * This is the configuration structure shared by the device a=
nd the driver,
> >>>>>>>>>> + * read when %VIRTIO_RPMSG_F_BUFSZ is negotiated. The fields =
are laid out so
> >>>>>>>>>> + * the structure is naturally 32-bit aligned.
> >>>>>>>>>> + */
> >>>>>>>>>> +struct virtio_rpmsg_config {
> >>>>>>>>>> +    u8 version;
> >>>>>>>>>> +    __virtio16 size;
> >>>>>>>>>> +    __virtio16 rpmsg_buf_align;
> >>>>>>>>>> +    /* The tx/rx individual buffer size (if VIRTIO_RPMSG_F_BU=
FSZ) */
> >>>>>>>>>> +    __virtio32 txbuf_size;
> >>>>>>>>>> +    __virtio32 rxbuf_size;
> >>>>>>>>>> +} __packed;
> >>>>>>>>>> +
> >>>>>>>>>> +#endif /* _LINUX_VIRTIO_RPMSG_H */
> >>>>>>>>>> --
> >>>>>>>>>> 2.34.1
> >>>>>>>>>>
> >>>>>>>>
> >>>>>>
> >>>>
> >>>
> >>
>
