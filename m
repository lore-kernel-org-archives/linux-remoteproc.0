Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com [209.85.210.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 705A337F756
	for <linux-remoteproc@vger.kernel.org>; Sun, 29 Mar 2026 16:38:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774802281; cv=pass; b=IZEYfDS+PrIAYMzRhPRmeZnS8z3oSdNCN8uN7Zsa0IWSEMRbNr4ZJsquxOcCrAKOL4vCH2qjJZv5bG1fsaMb0vVPWeN+gm0OQ+Zs1G0LWEttcy9vldLALAEGdN/xP3GJi/SPYJ3QAIzD91MYiyx5+OVF20RUoXeSJVJAfsQjuL0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774802281; c=relaxed/simple;
	bh=Un4NvkRawM6rAPkV/uPmoGeL3zxZW5HI65PGH4JT81c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BLZ9VQnGOvW5f25BiSX4xkY7i9t3aqHfpCWogbXdIhki2H8IY3G/tq99Mit5M7rAPABawDL2hmwfS3dApSVH8g4btijMKYe+ykrIW958odcU9XX/7vWguemhBCFfw56P0kmkYHwQg7umpCsu7VwRU3cR5Af0cmWTF4T6R+FaTJo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=asY2dXVp; arc=pass smtp.client-ip=209.85.210.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="asY2dXVp"
Received: by mail-ot1-f54.google.com with SMTP id 46e09a7af769-7d7447778b9so1913423a34.2
        for <linux-remoteproc@vger.kernel.org>; Sun, 29 Mar 2026 09:38:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774802279; cv=none;
        d=google.com; s=arc-20240605;
        b=HV0WWs+kGTqHKWXA5uyX4R14plTu85HJjhgYjJo7vnQpxCgN06tf0mOgStbUMZecuq
         7PmTADjei/UoamMqavtG5xCDpkpAPAETf1ycTPewqdazShhYNwIgHWOAQFV7SNDkfrVc
         yC3rO/cL8NR6WiCU7Sw8ApmXb1jQFGb0q4ny6An/+yE96bmGmAyrjwI3x53HOXBpVIQF
         d2+hnsA20EVkw3btGT0xUZm/F15URpnUlsdn0pTShGrIfTQD3EzRvpEvIR3tJ/ge6jb1
         BiPul4xCHl27kjlTkX5teA3WuMlEavcpwfc8Vm2xy3vRcbLObh3xqD06ydbj370pBlcg
         CMww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=dHchNBTHeszL2iAU7JVezGRet8r4iYUcgXKLaaZE2S0=;
        fh=6Y5Nl9TrSfQkj7ZqOtBcsIQOaV8RM7rNQInyHldw3cE=;
        b=ST1lqXYjdKLzVdwvnpkuIuhvMMymW0g8R10CbF99sxmRm03xK/0BO1+ih/JYac6nFs
         ukfCW+ezk7jpaxL4oZtkHnTam1cgxc6V6IpxsrLoJpJAMwIrhIesJtASQXP6FDW35FHO
         s1HrwhAkiQK0D4nh2F5o3xC+xaW74Au+HIH0B+qM5wwEym7DXaaSrcuUMBrO0IbsMXFO
         MGsIt2+/Hz3Q6nv+mgB1dsTaoXVQvtVdga6f1FktACVQcfyeOVQQT5IjqNkX5Ru6jhmU
         7n9H8ej75cBqWLfLCPmpvJtg7YKNsSrMRYXGQcvEnnw+GIT7z1Eba+Ptbojwla/nQnUC
         /wBw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774802279; x=1775407079; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dHchNBTHeszL2iAU7JVezGRet8r4iYUcgXKLaaZE2S0=;
        b=asY2dXVpxvpz8lJteG65lYCNtyUpmNmnO08qATyXHbdfhTpLXLXEQcDkn3wiJDw0/v
         IAUT47bU1YohMMVW3t0i15cwoFnZ/A1XnK6lAGdFmpPyDqyP0v3Sj8K5zhJaOMsr0Pa4
         Gae2oRG1D/H/d5VJKWKz+V06JzIEXihwudKM8FppC8a38ZFBQ4d7dAla1RzTShr+DGK3
         eBjrh6sVxyal94HaJubR4K6lzpAurRMoek5nsOy8YPtiKmMZCnm3UXuaOHe4Pxn0p8cA
         SVgGCi3Avi/ytewaKL3blcV/H5JPcDGBAjLdWCNZKh6fNxPE+UvhA3q78dw91W6jnyWv
         RLlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774802279; x=1775407079;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=dHchNBTHeszL2iAU7JVezGRet8r4iYUcgXKLaaZE2S0=;
        b=S/Bw7gBFGeglIK9+QX9787kMVBU0ixJwJc9FWOHn/PiYLW+vQq89M9XabM5WgEcluK
         Lopje9AQlTsodHFARO0aL5Ic1R2BpTwE/vPq/W907aq676nEIOwmXHX26q3Jq8lnsVrv
         f+3hZm265ml5URvCt9rC0kfQY0hdNhGQyfxGqGp1Gp3Q7DLCNqYEdvOmDjGyZj3w+JmE
         8EBlYzexPlQVvwRNx88P1GJkScNKwzYbvYrdC7d+Q59ov8d/434b7liAAh26ye4gj4h+
         Giq2yEcDZfBB0vjYdAF9FPQPzD7DCz09kzEV5iq+PJOVUy7urJgjA0QKf71U6C4E+Hl2
         yyNQ==
X-Forwarded-Encrypted: i=1; AJvYcCXbWS0Y6GRi/VqtHT4ur/ZM/rXPNODNznQVg2eBca6ysLtUw77hjs9ToYGqet9VvGkWpG5XsTIgIQ6m/74QM3Wo@vger.kernel.org
X-Gm-Message-State: AOJu0Yzodm/vRtHC+1o1XIysHCdxgQy9hij/haX2HvtEe/y0c/QugfeA
	hzv02U6CYeu/y7A0mB3fnapzljp4gHGQql2WnhgkouFxRDCGsvnNidRaH9bwEVWAJiqA5E97BHs
	dz7F0zzibT8+V9lXJnsrqf2JjEDwhTqY=
X-Gm-Gg: ATEYQzyPh7oq56ahKb/MbYIj2kYFjKxKv04vN2auGYvxIcat+cEwVVOBCVZqOd8VlcG
	RT/ghbkzJG0GUxyX8U8xaARFylRsu04Wc6aOkYizuqn2k3NZ2IqICf58ZvGafSPS/rwveZ2TOcA
	YwvVKjscC3M5gjKLfVZTDzJgBJ4sNXF6iFTUq5GWY6OdfPKzDkvQbMMh3+bFXbiNhtLKwA9xRoa
	mHCIlGwxuUK6G3TwiCuboLA/5QuAshQLPBmZ9rn+kM0zqsIhU7YXHXb24yRIuZr8IA9xV6T8/a1
	cBzcsbQp
X-Received: by 2002:a05:6820:615:b0:67e:212:827d with SMTP id
 006d021491bc7-67e1870c032mr5108712eaf.41.1774802279308; Sun, 29 Mar 2026
 09:37:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260209234430.512492-1-jassisinghbrar@gmail.com>
In-Reply-To: <20260209234430.512492-1-jassisinghbrar@gmail.com>
From: Jassi Brar <jassisinghbrar@gmail.com>
Date: Sun, 29 Mar 2026 11:37:48 -0500
X-Gm-Features: AQROBzA4srQB3Tyl0-QvNWLKjLsllXJXeRbwqVU4oSS7jBz_4eYyCo9ihi_kk9w
Message-ID: <CABb+yY3yyCDdN8THZXqsXm8jEyXsx9Sdgxhp9YHwo_0UWzvn8Q@mail.gmail.com>
Subject: Re: [PATCH] mailbox: add API to query available TX queue slots
To: linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org
Cc: tanmay.shah@amd.com, andersson@kernel.org, mathieu.poirier@linaro.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 9, 2026 at 5:44=E2=80=AFPM <jassisinghbrar@gmail.com> wrote:
>
> From: Jassi Brar <jassisinghbrar@gmail.com>
>
> Clients sometimes need to know whether the mailbox TX queue has room
> before posting a new message. Rather than exposing internal queue state
> through a struct field, provide a proper accessor function that returns
> the number of available slots for a given channel.
>
> This lets clients choose to back off when the queue is full instead of
> hitting the -ENOBUFS error path and the misleading "Try increasing
> MBOX_TX_QUEUE_LEN" warning.
>
> Signed-off-by: Jassi Brar <jassisinghbrar@gmail.com>
> ---
>  drivers/mailbox/mailbox.c      | 23 +++++++++++++++++++++++
>  include/linux/mailbox_client.h |  1 +
>  2 files changed, 24 insertions(+)
>
> diff --git a/drivers/mailbox/mailbox.c b/drivers/mailbox/mailbox.c
> index 2acc6ec229a4..22eb8f3213be 100644
> --- a/drivers/mailbox/mailbox.c
> +++ b/drivers/mailbox/mailbox.c
> @@ -218,6 +218,29 @@ bool mbox_client_peek_data(struct mbox_chan *chan)
>  }
>  EXPORT_SYMBOL_GPL(mbox_client_peek_data);
>
> +/**
> + * mbox_chan_tx_slots_available - Query the number of available TX queue=
 slots.
> + * @chan: Mailbox channel to query.
> + *
> + * Clients may call this to check how many messages can be queued via
> + * mbox_send_message() before the channel's TX queue is full. This helps
> + * clients avoid the -ENOBUFS error without needing to increase
> + * MBOX_TX_QUEUE_LEN.
> + * This can be called from atomic context.
> + *
> + * Return: Number of available slots in the channel's TX queue.
> + */
> +unsigned int mbox_chan_tx_slots_available(struct mbox_chan *chan)
> +{
> +       unsigned int ret;
> +
> +       guard(spinlock_irqsave)(&chan->lock);
> +       ret =3D MBOX_TX_QUEUE_LEN - chan->msg_count;
> +
> +       return ret;
> +}
> +EXPORT_SYMBOL_GPL(mbox_chan_tx_slots_available);
> +
>  /**
>   * mbox_send_message - For client to submit a message to be
>   *                             sent to the remote.
> diff --git a/include/linux/mailbox_client.h b/include/linux/mailbox_clien=
t.h
> index c6eea9afb943..e5997120f45c 100644
> --- a/include/linux/mailbox_client.h
> +++ b/include/linux/mailbox_client.h
> @@ -45,6 +45,7 @@ int mbox_send_message(struct mbox_chan *chan, void *mss=
g);
>  int mbox_flush(struct mbox_chan *chan, unsigned long timeout);
>  void mbox_client_txdone(struct mbox_chan *chan, int r); /* atomic */
>  bool mbox_client_peek_data(struct mbox_chan *chan); /* atomic */
> +unsigned int mbox_chan_tx_slots_available(struct mbox_chan *chan); /* at=
omic */
>  void mbox_free_channel(struct mbox_chan *chan); /* may sleep */
>
>  #endif /* __MAILBOX_CLIENT_H */
> --
> 2.43.0
>
Applied to mailbox/for-next
