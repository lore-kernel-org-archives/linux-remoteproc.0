Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.51
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793033960;
	b=zYOMoaTsj9WsO0D9+OqFG7gi7oH5wuE1a6DWlqkNOY+jH/Ou+1iTurEQARSFFTekfGwS
	 A7hFUjgLQyaOV0BLWmJ6GJamCHQXCnAOQwUiqGb2jP1E+1jMTJJcIEmG86ZoFdQadRASw
	 ZBREYhfkbsduCtgUZVQfsu0OMHJZuDI3QuOeoFY7N78yOlKPIxs1gjtFgVAAexSMM14Ck
	 ksHT0y2f1+7h/W1xY8/D024QCyIrcisOzTQeU/eZyBcAJ+YNGclc35E1hK7b9QmUrgYCv
	 HsKJ2U/plxXatatz2bhy4S1AeYK85Mdrx7mnrPZQPfFD29BfNM7efmz9yzQV7lVXh1g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793033960;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=RY1bDffZa37/A+dDgtm1Ka+aoSB+3ffBuKxboX/oHfA=;
	b=k361DkcZzNOHAZUTG+dek2JKwPqiQ5wRPdi/6uzaik5x9FynDtm6ftoOnFM/Ppoz9dQ9
	 KtMDJZmd+6RAV9jV1jbLfeGb0c6M4bv2nQE63Ks+c5ZgWnCGCUMad9LKRSuDmar+DTNAo
	 5z+zdlAcGSmWbG/gyvhsBBNDAO4xBO5RBAwk7UQDFlWLHnWc701bD2RlBjfUvmyH1VZzZ
	 cetgwWRJ9/USqOXJtWgRxNBM+gENO+9e32pzu43ZOvBluwGbNUdaKxMMtYz+l4Cqjjqzx
	 QfRNnGEDrZUu9i/9/bzxKDP9UvBmKWDKDTgVd/5Aco0Ee9YEKTRivqbVrRzcsNcmGTQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=pQ5w20z8;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.51
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D79B1606A31D
	for <linux-remoteproc@vger.kernel.org>; Mon, 26 Oct 2026 16:59:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D79B1606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=pQ5w20z8
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-6af8620a7d2so3833673a12.0
        for <linux-remoteproc@vger.kernel.org>; Mon, 26 Oct 2026 09:59:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793033958; cv=none;
        d=google.com; s=arc-20260327;
        b=g/XcNq0btRkeQEON0D8IpGFVBoNmTgkD9FdsCQUQMbZ22AdFbgVd1ke5VkCz32HkAe
         tQCf3zZE+gddFiFzJISsQgKSMLt3c+tf/9LKYGbDx6EEfDYaJgOTVA5t0oH4tyIVH6je
         j/pWNyxFxP1ZylMIbmv0Wq4h+2KGcWcKhi9DGBrCPVxfNbFUPBlE4iY+wgqjlpWjbTky
         qedAPItwnhmzW82AY7NJRXOCydLnHo/zikhMn2htQgFeKULSBfDh08onFuwPYSNnIJYj
         46iHTPsTZJP6LvhcpVspQlOz1vG8TQdclNnKNrJma5/i/lbt1ZqsVG9O31D81VUjoZzP
         U8jg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=RY1bDffZa37/A+dDgtm1Ka+aoSB+3ffBuKxboX/oHfA=;
        fh=Nbn7YHYtSnuQMG1H8souWVSZ7J9segIzG686sqgJ4RA=;
        b=XSf7eKt/2u8K4j2fvgzlr04UrCdSCZ/uKtwiga+3FDgc/LU2xrvOjQKw7pdj+RB1hC
         oh2yjEkmh3GNmXEekCX0eEDlSUlw2YTCejj2Sd+O1pGgCLCx5s0cfKvt6L4P9jXo7Vdj
         SwWCQR5bdgDV8nIjLcGlhPiq/iTO8ch+EpT0uYCPiTLWatOnvTCrydNqiqt8LWHMdEAd
         XZBrdT/MO95c1ZXMOuensmiC13C8G0PsxT9l6Qk58Z7O7YZG7oOs1om3mPG+J7F159TO
         43dWztE5EV614xve0bXcKWktPxFl8oubxlGJaSa5TWp2FhQcvb5Vsk1mz4N/YZqG/Y20
         HIGQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793033958; x=1793638758; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RY1bDffZa37/A+dDgtm1Ka+aoSB+3ffBuKxboX/oHfA=;
        b=pQ5w20z8DrbUxd5zhXXVhM5YDxnuQR2dNzyNn2LMDVx+NaMR1QzpqE9wS018QY0Lud
         INFzO80PR/U796ITsqku0tn2oFBzOuTu27zPnAQhMse3+OXCKXfVAkrqvyzu0Wr4uCGm
         rSQOX3/3FlVD7MRnwUArQ7NGFtrtmDD/kWvLV6Zh8BI8v/JiTXzi3kW9T4cCYQvlroyq
         4hvQeDxec8KnIR66YuCdM9KiCAqGxRyMhEJuUt6oKqLY300n/6GkIZqz1iPR1ym/KvTu
         vQSnVYdI7zN2YqWTc6uBs0H0bmD1dBnb7StrJLxS5BptdlUlajmFmq9nbrSzMw2a/cov
         IhRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793033958; x=1793638758;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=RY1bDffZa37/A+dDgtm1Ka+aoSB+3ffBuKxboX/oHfA=;
        b=h4EcWGCjS0e7ZFLBlOlep5OtNwbI3QRtgumRNYRORAGxp7BWMFkXlamJdekvOcdL7g
         i2fJjaa1/+N1llDmmoANkc3KqujwwLto/Pgyx/rRIp/2ij1MigOkiD7GvO8oJg+7wb28
         9egwHxJ6k49PDj+X/qBjghkvqfNtGifsQxE/A4/fZ+JmtPWW6Jkmo7T/zgskbqe/M7P1
         2UMj53PTno0HPhP4O7J8r5Udbg9v0hZcvQRrXYvs8vMYayW+Uv+gwuRIlDsc/bJDZ41w
         OV030psFWyra+NOBr3cTvsyAh6jd/T0XqKaVt8Qqq88UKpNJ3FIzi/rFUbvfZGACNIGe
         MRnQ==
X-Forwarded-Encrypted: i=1; AKwUvByXqNYuRxu9ad0bssNBcqXe2FS1UzDB/bck/BCXe3N4gyT+8UHuzfwmJ82OXucHmEBuZ8hHzO+6YqsxhcvcD/YU@vger.kernel.org
X-Gm-Message-State: AFq9FYIfpBxwsD8SE5gi0jMsdIAj4DyxpSEb1nIm7PYpwF+YqJk/t5OP
	DxNOAVh/NIYyrRBrk/TuqKrGhkzcdritaIp25iti0nfT6j9UR7AwFg+z3V5K+kdiRIf7Ba3pA/i
	0w1KFaNESGdd+jC6WTgRagvNH98JjWWkT/4jVF9j3AHcUEzOKXX/m
X-Gm-Gg: AYBFou1ESFlUuVyQFfGnDZRw1JGqR/7WKnVjAZfqeVEmA5HkWekeNssAafnv8QIYDc8
	5BmU7StUxvrBODDzilpG/VFufMV3rsUReuzyqqQvCe1lJutmojB5K8e6Q+6fI7IEogV6bjtvmv/
	YxFmuz/Mk8LS+qeEK8SjI0GK3GTivWkF3eL1RuJmkj0djkxyLwTeYpVmMWWFyKyJfMeeSTWdOI+
	ZjLPfidaEYflCQgho1ipUP0LWXPBSL7SAPoh/EcCpbPPRzhXXWJ07XeEL9P/TAB8DiS51q4IRQV
	BCVCNqWTduPvdGABug3RffnMR0BxHlXkq+1RwSzxerlM2cZ78WBg4hkjOC5nSKLKBxkCUUBfNui
	8+/zlLbyTqUu72JGbL3MVTYwhYCsg8YHvwBcCkN8UPoCNqfJVh9i6U4gwje5VdLfirpL+tA==
X-Received: by 2002:aa7:d350:0:b0:6b1:b97b:745 with SMTP id
 4fb4d7f45d1cf-6b442fdf606mr5057802a12.29.1793033958250; Mon, 26 Oct 2026
 09:59:18 -0700 (PDT)
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Post: <mailto:linux-remoteproc@vger.kernel.org>
List-Help: <mailto:linux-remoteproc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-remoteproc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261022194129.2233880-1-karin0.zst@gmail.com>
In-Reply-To: <20261022194129.2233880-1-karin0.zst@gmail.com>
From: Mathieu Poirier <mathieu.poirier@linaro.org>
Date: Mon, 26 Oct 2026 10:59:07 -0600
X-Gm-Features: AclHuK_fb4qQ-ybEQXexGd9Hx8PzUJoph_QuN68jKKcKteDOI7Hi4AR1Bo4gazE
Message-ID: <CANLsYkz6yjvDtV138pYZ1fAKgVcTvULu3QPC0MyZGkLSYMX+NQ@mail.gmail.com>
Subject: Re: [PATCH] rpmsg: virtio: bound the buffer sizes read from config space
To: Lianjie Wang <karin0.zst@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Tanmay Shah <tanmay.shah@amd.com>, 
	Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>, linux-remoteproc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 22 Oct 2026 at 13:41, Lianjie Wang <karin0.zst@gmail.com> wrote:
>
> With VIRTIO_RPMSG_F_BUFSZ, rpmsg_virtio_get_buf_size() reads the rx and
> tx buffer sizes from the config space as u32 values and checks only that
> each can hold the message header. The probe multiplies them by the
> buffer counts in unsigned int arithmetic to size the buffer area. An rx
> buffer size of 0x1000000 with 256 rx buffers wraps the rx part to zero,
> so the allocation covers only the tx buffers, and the driver posts the
> rx buffers at offsets up to 4 GiB past its start for the device to
> write.
>
> Reject a buffer larger than the header plus U16_MAX, since the 16-bit
> msg->len cannot describe a longer payload. With at most 256 buffers in
> each direction, this bound also keeps the size of the buffer area from
> wrapping.
>
> This patch is assisted by Claude Opus 5.5.
>
> Fixes: ca96ea25e51a ("rpmsg: virtio_rpmsg_bus: Get buffer size from config space")
> Signed-off-by: Lianjie Wang <karin0.zst@gmail.com>
> ---
> The patch is tested against a virtio-rpmsg device added to QEMU. With
> buffer sizes in config space that wrap the size of the buffer area, the
> unpatched driver probes and warns in rpmsg_sg_init() while posting
> buffers past its allocation. With the patch, the probe fails with "bad
> vdev config".
>
>  drivers/rpmsg/virtio_rpmsg_bus.c | 10 ++++++++--
>  1 file changed, 8 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/rpmsg/virtio_rpmsg_bus.c b/drivers/rpmsg/virtio_rpmsg_bus.c
> index 23ff6c8b7a20b..de4af75ee1620 100644
> --- a/drivers/rpmsg/virtio_rpmsg_bus.c
> +++ b/drivers/rpmsg/virtio_rpmsg_bus.c
> @@ -91,6 +91,7 @@ struct rpmsg_hdr {
>         u8 data[];
>  } __packed;
>
> +#define MAX_RPMSG_BUF_SIZE     (sizeof(struct rpmsg_hdr) + U16_MAX)
>
>  /**
>   * struct virtio_rpmsg_channel - rpmsg channel descriptor
> @@ -851,9 +852,14 @@ static int rpmsg_virtio_get_buf_size(struct virtproc_info *vrp)
>                 virtio_cread(vdev, struct virtio_rpmsg_config,
>                              rxbuf_size, &vrp->tx_buf_size);
>
> -               /* The buffers must hold at least the rpmsg header */
> +               /*
> +                * The buffers must hold at least the rpmsg header, and at most
> +                * the header and the largest payload its 16-bit len describes.
> +                */
>                 if (vrp->rx_buf_size < sizeof(struct rpmsg_hdr) ||
> -                   vrp->tx_buf_size < sizeof(struct rpmsg_hdr)) {
> +                   vrp->tx_buf_size < sizeof(struct rpmsg_hdr) ||
> +                   vrp->rx_buf_size > MAX_RPMSG_BUF_SIZE ||
> +                   vrp->tx_buf_size > MAX_RPMSG_BUF_SIZE) {

I will apply this patch when 7.4-rc1 comes out.

Thanks,
Mathieu

>                         dev_err(&vdev->dev,
>                                 "bad vdev config: rx buf sz = %u, tx buf sz = %u\n",
>                                 vrp->rx_buf_size, vrp->tx_buf_size);
>
> base-commit: bd1ecbb61afefc6a8b876ccbc31e9228b44e9eab
> --
> 2.56.0
>
