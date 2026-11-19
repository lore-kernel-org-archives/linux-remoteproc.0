Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795102172;
	b=UmSmh/A6H9EwYuc2amKIw6GhYL6WhaV24MoHp2QK4LgzmH1OA3Cq5t8Pn4eaCF9M1YtD
	 bfvOSDJzkuoi8BA9Q9qp8XHscvgCT+IWpD4vzaOIwSrog7MRrvuPOCj2jFnUMbp4+ji0Q
	 MkYsUuOo/oCcWoi2IhpESfjguH3FcQ5Zf2+JoT6EMWzC5uFpDYMMUo5GW8G+eub15/vgx
	 1wgz1RNjS7ur1ktrMw6Wc65t41cU0nxmFOvmXhIaCk87TRBNRSmSaq8inLF+saiC8mtqW
	 vGi/cQnlyYo3hWBIJxjjM6ifDCUKEVs2IErpIso0I9ZS2aoeBkJHWWpJIvxGdAqIN0g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795102172;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=aJBKwBt8iXnZSzkxcMNqzRBSFron06bNz2kQZO6DnuU=;
	b=dNfnxRmJz72tjcrGEPzR9R80DbQv9rqUrzqnRDRT8sgzPPuGmuGMYtZ6C9serZh43NLr
	 AoAedch+9CaN1eraqk1hVXsDd+M88RH6Q+jsgv4LvONKMSkrD9LkuilAZVDIBDpy61OhJ
	 BZiQg9arHWvNVm5AxFC0yDl2UKlOvv7TBc4iC15c5QKeKRs0FzDhmAaimOF0cvdi0byhY
	 +8Q/4BA7ac79urbtkJYUrJKgnqh/m+q0fbDzpxABjieeHdFfMDkKo3Uyf0nUXdAVs88ZP
	 j8y7anrFe4I2zsChp5yFfIkRog8ev66ExrpHFiUf7vXmGjxeJwSuNISNNN/ZWCrwlCw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=gsRQY8jG;
	arc=none smtp.remote-ip=209.85.215.181
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E266606A325
	for <linux-remoteproc@vger.kernel.org>; Thu, 19 Nov 2026 15:29:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3E266606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=gsRQY8jG
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-cde0daf3a2aso1335436a12.3
        for <linux-remoteproc@vger.kernel.org>; Thu, 19 Nov 2026 07:29:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795102170; x=1795706970; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=aJBKwBt8iXnZSzkxcMNqzRBSFron06bNz2kQZO6DnuU=;
        b=gsRQY8jG4Jij4ik+prsRTH+CLrrlVHqOXKsdOWeoBXyHCf00hlRP8SUU+0Fl2DyZpl
         C52NdgZ0U8ntHxsOkLcq2J4GfbaeLHIzxu0VaYXel/SDdO+YCxE2q2yEI9g7kX5DLkHd
         lR08nCVSGG3K9VN2h681WANzvCUsA5g0Yc7h/QEa+HpLOM0JxTRpOiLr7Eze50nte8ZV
         rpaZIdaJZdJEXlE0d5f/GgVCJJZlZ1DmGZullQvwSjvhRC9YZMjOjRGFOZVRxeHKB/Pu
         RC8mKho3Ap/L1NRRDLAHBgM/0onIXeSsILJ9pSn6QXOg0g0aoGWaB08OxaFwAqugPxR4
         3Tlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795102170; x=1795706970;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aJBKwBt8iXnZSzkxcMNqzRBSFron06bNz2kQZO6DnuU=;
        b=rPntycaVZ2OWV+daAJ4/UbmHIivYTmA08aFYJ/FHJgzxfrBvoyBHg1SuI21pzSRmKV
         xARWt3P9utSYObjm3u3FUKK9rRoLb94DMPNPlr4iepwY1iWlW0opplU2gs1wTjVO9pCF
         vgUboMYwuLOlcJGevUAVRkeFSar+03kKkMKFzb/chumK1qclEzfW3uL3KlAUpgZLEHXx
         trEW5I9jM1XKlzwdUbSPMppmwwoweIHug136ddJ4PVQZhJKxR7Wi/H5gtHEZDuqfhS8Z
         +mcoy3/J7GUwfbEfPbEDPpcMkpkvo1MCvMip0Rp4FrNc1tV3Io7W/CUFmCsEiTH9VEyA
         u9Og==
X-Forwarded-Encrypted: i=1; AL+hErHzn2P3AQjcio0CquKnKPA+SWq6YOj/ASFVZUbSoS0hgMAclP1RhB3jlvUQzc8HnK9gz64TuTa1rEBOhBtl+abm@vger.kernel.org
X-Gm-Message-State: APuU4Z+euLtdmL1hBj5+CeFrgiiBJKHr7PAHHUrfoug18EH6xJrFwZo8
	+EJS+HNsWoKtZAAlHN2KaSCXjuWooOE9ehSVcAe2jjgt/7RIgig319+mKcM+JYrcIOQ=
X-Gm-Gg: AZFdTZdRjZN96Tmve3QFflD627enVqB4atPVdY1LTPzRhpAlNhp5KIjKyeOOp1eVeLV
	tt73b7ByR/gRimkH+5+hDQQqcGYhriFPOC/JJjwczKLWbR456soHtOZP5fg/icRUPkHkLRRqqTC
	9Nh7Hw4NgGK+Tx+yc7XMXO3Xsike9l+OkYqkrEoRW4gP29GzvwOQB/odg1gmLFjopnqFXsmLb5p
	JVqUz50sTvVQOM6lfK30CeFb7xzE+ky/MRVK+wIz5lcmH07M0CTHjh4iV55bBynuEHXjTGh5k8U
	cSzQ0ExAEcPfHFIh1UDteGdjk8FXPTmhNNYQRqr7zJTSPiymz1axLIbUoPp1McxU1cVSRcPCMqc
	ECjGJJy2LJ78xYxN/m8IAe+EYW6zvj4/UNXmGirCOKUjzStsvcKWWF/PHuAjz84uV9rNP4e88Fu
	Q/0qaELaFhJZvyTCl6RwzPC0mfIGnrGTwdqpvecgoaFaZzy6RPa4beyKD0rOOetZWnpjYN3z0/P
	JiwOFeCSW4kJSAbb0+tiZaMHII8h2XYLcH8qpz3qu6SqaNaK5XNBBk/uujdbz08iObhLaA4XCFc
	xY9rcpt4W5JDUZSmGuLz4k7zY1C2VTod
X-Received: by 2002:a17:90b:250f:b0:3b4:1336:4f53 with SMTP id 98e67ed59e1d1-3b413365299mr462810a91.1.1795102170322;
        Thu, 19 Nov 2026 07:29:30 -0800 (PST)
Received: from p14s ([2604:3d09:148c:c800:9bd7:226d:1022:f6ef])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b402e75223sm1442633a91.4.2026.11.19.07.29.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 07:29:29 -0800 (PST)
Date: Thu, 19 Nov 2026 09:29:27 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Francesco Valla <francesco@valla.it>,
	openamp-rp@lists.openampproject.org
Cc: Bjorn Andersson <andersson@kernel.org>,
	Tanmay Shah <tanmay.shah@amd.com>,
	Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>,
	linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] virtio_rpmsg: fix config space alignment
Message-ID: <av8V18TntRP2U6hQ@p14s>
References: <20261101-rpmsg-config-size-v1-1-65686b445b22@valla.it>
 <au4QVFyk7Zzc6y2u@p14s>
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Post: <mailto:linux-remoteproc@vger.kernel.org>
List-Help: <mailto:linux-remoteproc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-remoteproc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <au4QVFyk7Zzc6y2u@p14s>

[Adding openAMP mailing list]

Heads up OpenAMP people, I will merge this patch in a week.

Thanks,
Mathieu

On Fri, Nov 06, 2026 at 11:37:24AM -0600, Mathieu Poirier wrote:
> On Sun, Nov 01, 2026 at 02:54:03PM +0100, Francesco Valla wrote:
> > The comment for virtio_rpmsg_config says that this structure is
> > naturally aligned to 32 bits, and this is desirable by some
> > architectures that don't get along with unaligned accesses.
> > The content of the structure itself however isn't aligned, and the
> > __packed attribute prevent the compiler to add this alignment.
> > 
> > Fix this by adding a padding byte.
> > 
> > Fixes: ca96ea25e51a ("rpmsg: virtio_rpmsg_bus: Get buffer size from config space")
> > Signed-off-by: Francesco Valla <francesco@valla.it>
> > ---
> > Hello,
> > 
> > unfortunately I missed this when the original patch set was sent, but I
> > think it's worth fixing (or at least discussing) this now before it
> > enters a stable kernel.
> > 
> > The same support in open-amp has already been merged [1], but maybe it
> > can be fixed before the next release there too?
> > 
> > Another, lower-impact solution would be to fix the comment, but that can
> > then led to issues on architectures that does not support unaligned
> > accesses (e.g.: AMR Cortex-M0).
> >
> 
> Thanks for bringing this to my attention.  I agree with this patch.  I will give
> Arnaud a couple of weeks to reply to this email though.
>  
> > Thank you
> > 
> > Francesco
> > 
> > [1] https://github.com/OpenAMP/open-amp/commit/744376f566c3ec7e06a7d093d785295b78aa486f
> > ---
> >  include/linux/rpmsg/virtio_rpmsg.h | 2 ++
> >  1 file changed, 2 insertions(+)
> > 
> > diff --git a/include/linux/rpmsg/virtio_rpmsg.h b/include/linux/rpmsg/virtio_rpmsg.h
> > index 0872cbca4593..d24fedb63023 100644
> > --- a/include/linux/rpmsg/virtio_rpmsg.h
> > +++ b/include/linux/rpmsg/virtio_rpmsg.h
> > @@ -23,6 +23,7 @@
> >   *
> >   * @version:	version of this structure, currently %RPMSG_VDEV_CONFIG_V1.
> >   * @size:	size of this structure in bytes.
> > + * @reserved:	padding, reserved for future usage.
> >   * @txbuf_size:	Tx buf size from remote's view. For Linux this is rx buf size.
> >   * @rxbuf_size:	Rx buf size from remote's view. For Linux this is tx buf size.
> >   *
> > @@ -33,6 +34,7 @@
> >  struct virtio_rpmsg_config {
> >  	u8 version;
> >  	__virtio16 size;
> > +	u8 reserved;
> >  	/* The tx/rx individual buffer size (if VIRTIO_RPMSG_F_BUFSZ) */
> >  	__virtio32 txbuf_size;
> >  	__virtio32 rxbuf_size;
> > 
> > ---
> > base-commit: cbbddb6b08cc9900a87cccaa9b22bbe06aa4f50a
> > change-id: 20261101-rpmsg-config-size-0dbe9ea63c6d
> > 
> > Best regards,
> > --  
> > Francesco Valla <francesco@valla.it>
> > 
