Received: from mail-oi1-f175.google.com (mail-oi1-f175.google.com [209.85.167.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 644ED14D29B
	for <linux-remoteproc@vger.kernel.org>; Sun, 18 Jan 2026 19:53:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.175
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768766011; cv=pass; b=i+Ed9Q9ihpGXHp7s+JwdiZIe5zw0jDMwqi2sjDfKQjMUOBSsizonVgMvzcV/3/qtJBu1C0u4YQgRo4GNJFHMsrjaJJyX2KHsLn11EfNbXRuxwYQF6T9Vph3W4wAFybII8Lp5KPIrWeaPn6PlPfj2Y53czBYhFpcIu1ORzo1SJCw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768766011; c=relaxed/simple;
	bh=5f3X6f0vNfxoIG+9kLIL2WaJCLBUb50+Ux3jq2mxzIc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DLV6tPe61KsGVZCEg71dR4PbOX4TEeF2uum9s76GQv425daZNEer6yPSSSF704fn9wO5FoS3phmak8m+5lARzunpsa/hqvwyRtCCuof54RsC3QL9GNnCFE+RSi/mj3sQEr/lHkq2f7nNrEKTNefKQmC3+h+h0ZRVWhCYPQ3lPkA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fu/C9G6b; arc=pass smtp.client-ip=209.85.167.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fu/C9G6b"
Received: by mail-oi1-f175.google.com with SMTP id 5614622812f47-45c93e60525so1905575b6e.0
        for <linux-remoteproc@vger.kernel.org>; Sun, 18 Jan 2026 11:53:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1768766009; cv=none;
        d=google.com; s=arc-20240605;
        b=jnGuDgsJHH1GesLVb/6VTz65jdBGdeW2jkrVYAV9rJYxgrjUsQjp656Vpbl25OTB15
         ctiUk4vP090+6ZlMtNtHT+YJREuF9zvNA1d/VuKLWVX5o67wDOLhDM8nnGDv0yxQKO9T
         7JHJaE22uHmC1Uisb+IVDs+PbkzWSNWBTdQI5oQxhJ4jV2l27I4hLDCIcIkLZ7NPLDsz
         0JSVUoECCKfOXRhYXurxcgT16i40vaTbYdb3taMzYWuZEeeNWUuJd8mxJ9iizETaL5YE
         NOumHLw3S0LNjFWI7ABAHWF/0WZbKDtO5i4p2KFuUSiRaqhJ4rY/8tKXknROcGma8HUp
         yW3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=bkGMFf+QKSRG5c8+ZB+uMvze7bPzc4a3HTnfrDpj+Jg=;
        fh=UAIzhPmgmNFVLfnAmC2BX1tInHOqLEoJsk4OKENiblQ=;
        b=It488HWx3h8nZEXLXLgYmXRmZ80Op7dwhnwaj9fAjq6HWjKDg4NchIzryOHzWzd9Yl
         PhmJnRpTLtz1IYH/tsnB11MDflxQ//ErMMV26Lr8GzYxOq/5ndKe/9ZwFS8GFrgEgYkU
         DWcZrmMhFX93VDhOMz5MkytQZTCK6fyQmuIUJeHCcwq93ePEwGesOgeblzC6aEc8DYvK
         2z7lT4oNsuSYjpkslRmIaJVA9xRzx67dONlicZghZo+XG6gwxsdvJ1AufHU3nLQhC6Vp
         UQ5Cb1gvQJOCk/j3KbCOkZuhWFiPoy+uKabQTmr9cEAnVeOB3s4imjA6m4dsRFIlCrp9
         GZ5Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768766009; x=1769370809; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bkGMFf+QKSRG5c8+ZB+uMvze7bPzc4a3HTnfrDpj+Jg=;
        b=fu/C9G6b24g2alNGaP9Q4WA7zcQmDWAaezz45az0i/0666NtQDHRqlqHajfrbpdDvh
         OPVlyGBrwrnZ6YCaB5Uq00G6maQfxn1Jy7TcXXBIv9bXaJcc/Wr6RLxlJodAxfN1aNi8
         gLh9pZ7hy86DXwtPwIC7kSocYzs/+sedPPJRnBD/M4i2wfMUbR2Qu3Fdsr7vdyNhvRGh
         ApKsTrVowRaaPDI+uJxhrPCAY+d3xHll0wy+aRa/wjD4QkB7EilAE1MdxQQoN5cVGSl6
         uYa2hXLGbOwFpHZ8j/js71PJmV8LDE5fvRuOBCTM7BjYdhX0XUZKRgxWaPAm4rN7MBN0
         YsJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768766009; x=1769370809;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=bkGMFf+QKSRG5c8+ZB+uMvze7bPzc4a3HTnfrDpj+Jg=;
        b=B4ai1Nf5aCSJb6mqvxOcohOTWHXXktears4gmiL9aZPTVPxArNFrDPi/e2pxxenOQD
         9Oi65YBZpcPEEh6hDQ4b+ks4TfHThy8L4nCG7kMMQBGLHTgXV5NSUj8KfuGDMaXxAxt7
         nHrtzBnes+6J0UwqvKlTxqJFHvUjyO0/dBNdgh188u9RPyLlOEeRkXhhZ8+WeNSgQ1pS
         7VmxE2E4qJuNM6mHH9Wwig9EWq/khwAiDEqAPPWf3Yz/RLFeqrAk6aqBZoFaUzBJwPe8
         03KRDTK9OK5okUa4ji0aPWC1b6S7rKDXRHcLupzUxQiaYsw5KAOEvdX5w2zd7KOGxUrH
         f3Yw==
X-Forwarded-Encrypted: i=1; AJvYcCV/pziuMVKyvb9XQFnWs1Bub4x5V6TSuEo2dPS0vh8EIuw6Gr+rJs24pQW0t8pH4xM3QnzqpnxbpTDcnGKP96ND@vger.kernel.org
X-Gm-Message-State: AOJu0YyesEA76Vj0rAO0oLERxIJTtN031KiU14mM/CAOE/jZMI3l9ucQ
	kGVwVzH433M8yHrriPMSZdqkEWvNE9oKEP6wBRD7P04Zf7tIuEzVuC4Yz4GNPcvdz+kt6vOA3rD
	vzLyUHfShcXnDyu6OdKx1Ylwq7fvS5Sw=
X-Gm-Gg: AY/fxX5J2yp/hTKGfjY+p52ljQhfiDglFfngWH0z+WD9hErvNvWfBHWA5xHsu2ggIfz
	KiH5YYdTl3LfjHeGfC6ybcAvy1J5ECaNizb35VdsdHVEKgNnj26YfbY2Lv0IKLUsK2H04wGi2Cs
	sezHrS4y3GM7hgrefnSRdsFLsPMa1gsNe+7iPAuLuz7vPnepmabmcUDkcmbX4yEUpyOkjY9wGGn
	C8EYrH3/GiuK05hAlH25W+z7DUWKQH2/Y2U3l4U8GECvj7CHGdUjMVBPgfCEhM0SeR5W7Yt
X-Received: by 2002:a05:6808:4fd1:b0:450:275c:8803 with SMTP id
 5614622812f47-45c9bf7d896mr4729521b6e.28.1768766009310; Sun, 18 Jan 2026
 11:53:29 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251217212728.1540043-1-tanmay.shah@amd.com> <20251217212728.1540043-2-tanmay.shah@amd.com>
In-Reply-To: <20251217212728.1540043-2-tanmay.shah@amd.com>
From: Jassi Brar <jassisinghbrar@gmail.com>
Date: Sun, 18 Jan 2026 13:53:17 -0600
X-Gm-Features: AZwV_Qh6kIE4kgZuSLGSoJXLFu0oIGj6HaWJnOC-tbN_-KBScH_G2Q6hD0pWR1g
Message-ID: <CABb+yY0b+UOqLgmVz+T-e_zxYJ=sLcMA3um6q8EVOQpnB=L3Hw@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] mailbox: check mailbox queue is full or not
To: Tanmay Shah <tanmay.shah@amd.com>
Cc: andersson@kernel.org, mathieu.poirier@linaro.org, 
	linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 17, 2025 at 3:27=E2=80=AFPM Tanmay Shah <tanmay.shah@amd.com> w=
rote:
>
> Sometimes clients need to know if mailbox queue is full or not before
> posting new message via mailbox. If mailbox queue is full clients can
> choose not to post new message. This doesn't mean current queue length
> should be increased, but clients may want to wait till previous Tx is
> done. Introduce variable per channel to track available msg slots.
> Clients can check this variable and decide not to send new message if
> it is 0. This will help avoid false positive warning from mailbox
> framework "Try increasing MBOX_TX_QUEUE_LEN".
>
> Signed-off-by: Tanmay Shah <tanmay.shah@amd.com>
> ---
>  drivers/mailbox/mailbox.c      | 3 +++
>  include/linux/mailbox_client.h | 2 ++
>  2 files changed, 5 insertions(+)
>
> diff --git a/drivers/mailbox/mailbox.c b/drivers/mailbox/mailbox.c
> index 2acc6ec229a4..b7ae5c173143 100644
> --- a/drivers/mailbox/mailbox.c
> +++ b/drivers/mailbox/mailbox.c
> @@ -36,6 +36,7 @@ static int add_to_rbuf(struct mbox_chan *chan, void *ms=
sg)
>         idx =3D chan->msg_free;
>         chan->msg_data[idx] =3D mssg;
>         chan->msg_count++;
> +       chan->cl->msg_slot_ro =3D (MBOX_TX_QUEUE_LEN - chan->msg_count);
>
msg_count is protected by a lock and limited within MBOX_TX_QUEUE_LEN,
so how about simply   chan->cl->msg_slot_ro--;

>         if (idx =3D=3D MBOX_TX_QUEUE_LEN - 1)
>                 chan->msg_free =3D 0;
> @@ -71,6 +72,7 @@ static void msg_submit(struct mbox_chan *chan)
>                 if (!err) {
>                         chan->active_req =3D data;
>                         chan->msg_count--;
> +                       chan->cl->msg_slot_ro =3D (MBOX_TX_QUEUE_LEN - ch=
an->msg_count);
>
Similarly   chan->cl->msg_slot_ro++  ?

>                 }
>         }
>
> @@ -321,6 +323,7 @@ static int __mbox_bind_client(struct mbox_chan *chan,=
 struct mbox_client *cl)
>                 chan->msg_count =3D 0;
>                 chan->active_req =3D NULL;
>                 chan->cl =3D cl;
> +               chan->cl->msg_slot_ro =3D MBOX_TX_QUEUE_LEN;
>                 init_completion(&chan->tx_complete);
>
>                 if (chan->txdone_method =3D=3D TXDONE_BY_POLL && cl->know=
s_txdone)
> diff --git a/include/linux/mailbox_client.h b/include/linux/mailbox_clien=
t.h
> index c6eea9afb943..a073fb0c03d1 100644
> --- a/include/linux/mailbox_client.h
> +++ b/include/linux/mailbox_client.h
> @@ -17,6 +17,7 @@ struct mbox_chan;
>   * @dev:               The client device
>   * @tx_block:          If the mbox_send_message should block until data =
is
>   *                     transmitted.
> + * @msg_slot_ro:       msg slots remaining for this client's channel.
>   * @tx_tout:           Max block period in ms before TX is assumed failu=
re
>   * @knows_txdone:      If the client could run the TX state machine. Usu=
ally
>   *                     if the client receives some ACK packet for transm=
ission.
> @@ -29,6 +30,7 @@ struct mbox_chan;
>  struct mbox_client {
>         struct device *dev;
>         bool tx_block;
> +       unsigned int msg_slot_ro;
>
maybe call it 'tx_slots_available_ro' ?

Thanks
