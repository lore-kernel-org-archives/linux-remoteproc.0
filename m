Received: from mail-oa1-f46.google.com (mail-oa1-f46.google.com [209.85.160.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 940DE311972
	for <linux-remoteproc@vger.kernel.org>; Mon,  9 Feb 2026 23:27:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770679665; cv=pass; b=R9i0HCN5NmHYNPvpdloV9vjGY7U9iuB3nz5WuZPzgwjzcdMoh7veftFFvfzcx6Ad8Gun8VK7Vv9azhV7sIY4D+7RYhUAG5ziTdiE8Qq9Z2wliK7+0ZSSDfrBJVhmJsK+EvR9FggmwfeEMOOQK9g8ZaPe/ksQ2CBZoHI14GeXnXA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770679665; c=relaxed/simple;
	bh=Rmj8r3Q5AAkLrGQWE2TRPrVl0cCPRy7H9xBH0lW9l0E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=W19nsjS6+V6EJVO9obkC2S2uKzO11DyzHipNPYDVfGhhEomCaN/eXop+as/jNLEgQ9yy980Z1LiHmnQe1pdea+SjR/q6RjxXwUov9IytUV1nYz4IneUH9RJl+uJwyyo/zrlSmJIwAM4HDRCojjr+eqwbgVWRpb6YK2JeDh6ftJU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GqZ3rpM/; arc=pass smtp.client-ip=209.85.160.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GqZ3rpM/"
Received: by mail-oa1-f46.google.com with SMTP id 586e51a60fabf-40423dbe98bso1573067fac.2
        for <linux-remoteproc@vger.kernel.org>; Mon, 09 Feb 2026 15:27:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770679662; cv=none;
        d=google.com; s=arc-20240605;
        b=enpk0J7VOdN6M03Vb9o0VH1dwFfn0gM64dm5rZNNDz/h4c4fkdalAJlZ1wUNn3Uktf
         63c1WQHd3oeTY5QLfeFC5jtA+9rFyOcRA++lsUUmRmDj4PIOJFRbmpXeOklTeqNKmU9y
         YNMnVlMJkbFT0MiGY0OEhW9yyZt8vmXyzPY9skA3iT2uTNw/Zx+dqSZEEnFZQmUntEny
         ySvOh/NDxEaw3YyBfD2Ai30QO1jqG7oFysVTghoSaL9/c5YNhYSAgQxMXwOeV1KaygSV
         mXPkYJcFlwYbNY5Yab4EhQgB0iuNUxGjkyt80nVZ5R4A9C5zrZAE1f9Sprtx/C8uZvi+
         AwOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=iEMvPZ8Ut4I6dtVkVZ7GlKgtX7rDLlvurPpgf9AtOzU=;
        fh=UiTi6tRxLe4iw70bTfoGu2ZzKHqzEY5Ut+8H0GzhLPY=;
        b=AGP1jzUgCpaYXawfImyZlh7BlGztYvnyPidyUGsIbCZRPCoBenkImEsMxeQla2E1NQ
         YoMijRclhNO2lPb0w6M8SgYeKCHnjukMXze+KAcC+p3ZvuiSwElppjzOAKqGZl+EVQlM
         brAKou9+KpYT5rS9mKwdeSyCAhbaETC9AJMNgc9WQbLXuJ2sV2HJaXJZTf9lxUXE55f9
         UVFM3CJl54ObFSO8UOzCQBwAm1GPmSckdQEc4YjK1vA7tWaRhE9Fe4zALKXCTJ3pdTaY
         ZsGV3yHi2VsTHMjex6i+Xey7AyWo3K70aoTgA73ozVHtk9kq5DaPSzq2kwnKsvqVzCAf
         J1Fw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770679662; x=1771284462; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iEMvPZ8Ut4I6dtVkVZ7GlKgtX7rDLlvurPpgf9AtOzU=;
        b=GqZ3rpM/w7PIhDrhaFokNZD9hzJfohEuzmkFjWp9biQjGIswyVraQUteRwLzG6NBHS
         eJC/otKzCMDZYaroKi9yfSpeEnChJEvsePkFpFo/y7O3aHRg19YUHFG0pVF3fyVLaUaE
         N0qHdAR6zlmMKCViV6qJOKwNMWTt+Fe2ePY+tbQUVxNdmRhrT0geonqDmkgv+xNpr6z+
         3IxJBPq67ikD1V5cdQxhzvZkz6pronHagqu77w1sY2Mam3o4wqqVcK7z+SY5EQ7XBWwI
         +iobHXBXU+AWauUqHr/Pm1Ii20zVbr9rgD+bkA5ytzQpzzypC6Y4nlQ6F2bKAx+MBEU3
         JIgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770679662; x=1771284462;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=iEMvPZ8Ut4I6dtVkVZ7GlKgtX7rDLlvurPpgf9AtOzU=;
        b=BBvqYnL2Mav4HkCWBrQwjqh++lH5ix2vLER2zWUMBdSIYURmoafeBPvLwZwMqdIkOw
         SCYs/zKA+rjHHK2px/fK1Fevg2NNtSQZM8DHrX322xBtaIvZ0xlKB5CoEHxHFd6BUOpY
         RzYQdyQDw1IUj6PnXgRM8e4nRaeYa0xZMFbcWptLRpvGPDko6IIfzWHpWGmihz2PM74g
         FsyjAkHzMIcfCxV/P4VXHcLdcTo4ziTjnDAj924XDjzPugXxPnO8D53SXz5eQNNR5Vua
         cbNgNpCyQogke4syFaVnhZXruTJKj03Qur75OU53kPygqWfMBmQ1g1gfnvvUpwI02XOZ
         C92g==
X-Forwarded-Encrypted: i=1; AJvYcCU4O74WEVzmDr/HtwspPx9ww0Zyhd1lag+QN9H3wq3hnywZt0wPLJcgMGVe9diMNfVbFAvXbwAbLTDsQhiHDWM3@vger.kernel.org
X-Gm-Message-State: AOJu0YzsjxdjCjb4A28KUIM5k8zVgrd07yPpdBQAknTxBnUN3q9RwYfR
	LNsXUlQ7XO/lt6TAxvvPfs1ZLHQDkJ8NIjhHWZUdcltdIHRX0NzRqef7B4DRPFU2o6FQ+zXglgq
	8Njs54K/ZJ2p8H1TNQBAgjm+gmXn5DKs=
X-Gm-Gg: AZuq6aKGAt0AjDwv3BMwUKMX9GxKoEXy+7Tk52coOOb6uVrB/6LrEMeDqvALKgLVWvl
	dcec0elYBedSLza5tA/FcRIofqSEc3sQsU4wfkpj+KE5gZOq7LQxDcIDz+c5Lz+H8Pzl9enVIgu
	2ig4rj+QY0sSikbKW1ih+cozoPJdmtBSUvTHhjgOlHNzTVz4SHDUKrl5X3m0CsjQJdgTfuZHW9K
	6lbu/0Hbd3XICOjfLt0J3O5hISd6gdaK7Eslm2tHASb4vbVIx/UwnUkOJOgCB0nLY44cFmz+o42
	HnoJiWeyK5AnhI8liXA=
X-Received: by 2002:a05:6820:6ec6:b0:66e:10ca:fcd5 with SMTP id
 006d021491bc7-66e10cafdcfmr3786602eaf.12.1770679662462; Mon, 09 Feb 2026
 15:27:42 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260203225821.3293475-1-tanmay.shah@amd.com> <20260203225821.3293475-3-tanmay.shah@amd.com>
In-Reply-To: <20260203225821.3293475-3-tanmay.shah@amd.com>
From: Jassi Brar <jassisinghbrar@gmail.com>
Date: Mon, 9 Feb 2026 17:27:31 -0600
X-Gm-Features: AZwV_QhNkWCpwkpEao1OJf7hQy6YZe5Ftva_JMscwZVfEgetxSjs0LKrpNT9OfY
Message-ID: <CABb+yY12vSxs=TA42ybkFUUhdbXyxkGoFMBfk01xm-Tb+g6q1Q@mail.gmail.com>
Subject: Re: [PATCH v4 2/3] remoteproc: xlnx: assign mbox client per mbox channel
To: Tanmay Shah <tanmay.shah@amd.com>
Cc: andersson@kernel.org, mathieu.poirier@linaro.org, 
	linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 3, 2026 at 4:59=E2=80=AFPM Tanmay Shah <tanmay.shah@amd.com> wr=
ote:
>
> Sharing mbox client data structure between "tx" and "rx" channels
> can lead to data corruption. Instead each channel should have its own
> mbox client data structure.
>
> Signed-off-by: Tanmay Shah <tanmay.shah@amd.com>
> ---
>
> changes in v4:
>   - separate remoteproc driver patch in to two patches
>
>  drivers/remoteproc/xlnx_r5_remoteproc.c | 19 ++++++++++++++-----
>  1 file changed, 14 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/remoteproc/xlnx_r5_remoteproc.c b/drivers/remoteproc=
/xlnx_r5_remoteproc.c
> index bd619a6c42aa..109831c5815c 100644
> --- a/drivers/remoteproc/xlnx_r5_remoteproc.c
> +++ b/drivers/remoteproc/xlnx_r5_remoteproc.c
> @@ -74,7 +74,8 @@ struct zynqmp_sram_bank {
>   * @tx_mc_buf: to copy data to mailbox tx channel
>   * @r5_core: this mailbox's corresponding r5_core pointer
>   * @mbox_work: schedule work after receiving data from mailbox
> - * @mbox_cl: mailbox client
> + * @mbox_tx_cl: tx channel mailbox client
> + * @mbox_rx_cl: rx channel mailbox client
>   * @tx_chan: mailbox tx channel
>   * @rx_chan: mailbox rx channel
>   */
> @@ -83,7 +84,8 @@ struct mbox_info {
>         unsigned char tx_mc_buf[MBOX_CLIENT_BUF_MAX];
>         struct zynqmp_r5_core *r5_core;
>         struct work_struct mbox_work;
> -       struct mbox_client mbox_cl;
> +       struct mbox_client mbox_tx_cl;
> +       struct mbox_client mbox_rx_cl;
>         struct mbox_chan *tx_chan;
>         struct mbox_chan *rx_chan;
>  };
> @@ -230,7 +232,7 @@ static void zynqmp_r5_mb_rx_cb(struct mbox_client *cl=
, void *msg)
>         struct mbox_info *ipi;
>         size_t len;
>
> -       ipi =3D container_of(cl, struct mbox_info, mbox_cl);
> +       ipi =3D container_of(cl, struct mbox_info, mbox_rx_cl);
>
>         /* copy data from ipi buffer to r5_core */
>         ipi_msg =3D (struct zynqmp_ipi_message *)msg;
> @@ -269,8 +271,8 @@ static struct mbox_info *zynqmp_r5_setup_mbox(struct =
device *cdev)
>         if (!ipi)
>                 return NULL;
>
> -       mbox_cl =3D &ipi->mbox_cl;
> -       mbox_cl->rx_callback =3D zynqmp_r5_mb_rx_cb;
> +       mbox_cl =3D &ipi->mbox_tx_cl;
> +       mbox_cl->rx_callback =3D NULL;
>         mbox_cl->tx_block =3D false;
>         mbox_cl->knows_txdone =3D false;
>         mbox_cl->tx_done =3D NULL;
> @@ -285,6 +287,13 @@ static struct mbox_info *zynqmp_r5_setup_mbox(struct=
 device *cdev)
>                 return NULL;
>         }
>
> +       mbox_cl =3D &ipi->mbox_rx_cl;
> +       mbox_cl->rx_callback =3D zynqmp_r5_mb_rx_cb;
> +       mbox_cl->tx_block =3D false;
> +       mbox_cl->knows_txdone =3D false;
> +       mbox_cl->tx_done =3D NULL;
> +       mbox_cl->dev =3D cdev;
> +
hmm... this looks bad. Sorry.
I think all we need is to export
  unsigned int mbox_chan_tx_slots_available(struct mbox_chan *chan) {
return MBOX_TX_QUEUE_LEN - chan->msg_count}
from mailbox.c, of course with protection of the channel lock.
That should work for you, right?

Regards,
Jassi
