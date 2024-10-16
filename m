Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 298E720E021;
	Wed, 16 Oct 2024 16:04:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729094684; cv=none; b=Mq9HKRyaqx9N9lACIO8StbSOpITIANt4+3AKjel8X8GggppsoTHqx7AlEitq3QuVtl5JH1At/aTj106i9lfdqTu73jQHCRVYodk7NVsX08dca0xmDJI2pUunprcXfUoD+XteC76EpidSEKNfFtnH4daQoiDCH8V9OT8/b/gT8Ys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729094684; c=relaxed/simple;
	bh=EKUEzfiN3YmtYYObeTxmHkJxrDJnt9VxyDY0QeTrbWs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=e4iDnQyNi6zj+1MY8giVY0inKPycrzYQLZZPRr0U8A6HEpD7Kk57HoOZ5MllAyyPrWfmt1V4dkN0D3oNgwjB6CalRiDIQ9M69w+s5OS+iIiPVEa6HPfllvMyQ/0y1EfXwT/yzWDZdF28VRgoQ7hJi+h+hp2CwuxOTzdwnECQLzk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LHLf4DoB; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LHLf4DoB"
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-539e1543ab8so8683250e87.2;
        Wed, 16 Oct 2024 09:04:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729094680; x=1729699480; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GNQBpV9vPDQPiHMaNRNKdEtYD8Kastgat0oNqI9eUbM=;
        b=LHLf4DoBRCsgZJv0CC9LbdaT9ziQrgMSEfFHhTmA07ImgbJK6rm8TCxK91koTUvsjT
         FoKNH90NWpp38vM8GKXKVbWf/DKxUVTh/X7qt1mjHKjxBKoUJaqvEKEEJNjVZ823DUdW
         3sHT8MGJrz1cxbBbHyQzrFtYGe+yv/SPu1s033W+FkzBq5CVDEqHY0bZZw4o4GaJusA3
         LuOEPIkI6NSbR6QpmkwM8y7HpGLicUWnsQYKIlSmT+JQ6kDXcVu3Y33KFkHd0pMD7/ed
         vaIAuL8otDhsvqw+LoiS0mwa24KbsTguY1a4XBZ23FAWy1SbxVJBgj17cOs+7tGvRkvz
         rbfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729094680; x=1729699480;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GNQBpV9vPDQPiHMaNRNKdEtYD8Kastgat0oNqI9eUbM=;
        b=UYgpzD/w9pK6qyautTNfT7yJYnrWI6vxjUbliZMX5HSrXNace3wmgoqNBqDEUsLRfC
         7Lq8zUBM2NfEImDZptuBm9se50scHmf3zMLTgR7tjFTFVW8Z5k9gh9C0WBfMVi4UvZrz
         Bs9q6PKONkIW2kIqQjHTwhd2kkPnX00mZOCA6LUyvFLoqdgMIPuW9iZ7ZMv4NQ8N3o+x
         K+FZ+p7wfPOcRGMgJG9cd0OfuXNS1xuMfaVMYFAD5f3oZ521dZiAUCJ/N2aUK743TJks
         PsHw3wvIbIV7pXgcXiVtFdENswmVAlKcQhZNO317w02UR6hX/SaanCWs/QIFIwCC2JFP
         +pLQ==
X-Forwarded-Encrypted: i=1; AJvYcCV4sfmqjDi/uxfEPkRfAnZMJIO6Tnk/9RA+Tzi8yKQV/0SkwNEsJTA4mVgMJ+IVDyGyHcAc3CiUVCG3kzl5+xr2Yg==@vger.kernel.org, AJvYcCXHPJQPipnDpvOxj7Yl+YioUGSS/2jJ+uLhCnfd4YHfMpewzdv/9kPTX9ypCta4L/DWAVculWR4YQjnRNA=@vger.kernel.org
X-Gm-Message-State: AOJu0YwslcvI4e7GnmawNdGU81h9hNT9bdClkp8HbWlWT7+LDjVMxj2Y
	vMTFZ4V8twxo8riFOlZBH4xRZDcOhxE1imgLLtg9pm12AzqWVn1kgAjsicAzdGJR5VbksJ5kiK9
	QUvY+zpGhN2bbSkv0hSbI8IvvG6g=
X-Google-Smtp-Source: AGHT+IHTfdOsutRT8m9ec/Y2Ofh5xKP8lNEpD8YNQl32O/trKfsU29BoYw0WuAcEok2Y/C0Rm8PMWo6RhNhJCFzenbI=
X-Received: by 2002:a05:6512:1598:b0:539:905c:15c5 with SMTP id
 2adb3069b0e04-539e5521da6mr11438781e87.35.1729094679769; Wed, 16 Oct 2024
 09:04:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241016045546.2613436-1-quic_mojha@quicinc.com>
In-Reply-To: <20241016045546.2613436-1-quic_mojha@quicinc.com>
From: anish kumar <yesanishhere@gmail.com>
Date: Wed, 16 Oct 2024 09:04:27 -0700
Message-ID: <CABCoZhB3NNv0bi=wDvQ9HzYBin6qP522QrMvqw=HSnLn8VgeOg@mail.gmail.com>
Subject: Re: [PATCH v3] remoteproc: Add a new remoteproc state RPROC_DEFUNCT
To: Mukesh Ojha <quic_mojha@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Mathieu Poirier <mathieu.poirier@linaro.org>, 
	linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 15, 2024 at 9:57=E2=80=AFPM Mukesh Ojha <quic_mojha@quicinc.com=
> wrote:
>
> Multiple call to glink_subdev_stop() for the same remoteproc can happen
> if rproc_stop() fails from Process-A that leaves the rproc state to
> RPROC_CRASHED state later a call to recovery_store from user space in
> Process B triggers rproc_trigger_recovery() of the same remoteproc to
> recover it results in NULL pointer dereference issue in
> qcom_glink_smem_unregister().
>
> There is other side to this issue if we want to fix this via adding a
> NULL check on glink->edge which does not guarantees that the remoteproc
> will recover in second call from Process B as it has failed in the first
> Process A during SMC shutdown call and may again fail at the same call
> and rproc can not recover for such case.

What is the guarantee that the second stop also will fail? I feel
it should be handled in user space, if rproc calls are failing then
there is a bigger issue and then let userspace decide what to do if it
is happening continuously. Also, why not add this DEFUNCT_STATE
in other callbacks, as all callbacks from core to rproc driver can fail?
>
> Add a new rproc state RPROC_DEFUNCT i.e., non recoverable state of

Even if this state is present, ultimately it will be up to user space to
decide what to do, right?

> remoteproc and the only way to recover from it via system restart.
>
>         Process-A                                       Process-B
>
>   fatal error interrupt happens
>
>   rproc_crash_handler_work()
>     mutex_lock_interruptible(&rproc->lock);
>     ...
>
>        rproc->state =3D RPROC_CRASHED;
>     ...
>     mutex_unlock(&rproc->lock);
>
>     rproc_trigger_recovery()
>      mutex_lock_interruptible(&rproc->lock);
>
>       adsp_stop()
>       qcom_q6v5_pas 20c00000.remoteproc: failed to shutdown: -22
>       remoteproc remoteproc3: can't stop rproc: -22
>      mutex_unlock(&rproc->lock);
>
>                                                 echo enabled > /sys/class=
/remoteproc/remoteprocX/recovery
>                                                 recovery_store()
>                                                  rproc_trigger_recovery()
>                                                   mutex_lock_interruptibl=
e(&rproc->lock);
>                                                    rproc_stop()
>                                                     glink_subdev_stop()
>                                                       qcom_glink_smem_unr=
egister() =3D=3D|
>                                                                          =
            |
>                                                                          =
            V
>                                                       Unable to handle ke=
rnel NULL pointer dereference
>                                                                 at virtua=
l address 0000000000000358
>
> Signed-off-by: Mukesh Ojha <quic_mojha@quicinc.com>
> ---
> Changes in v3:
>  - Fix kernel test reported error.
>
> Changes in v2:
>  - Removed NULL pointer check instead added a new state to signify
>    non-recoverable state of remoteproc.
>
>  drivers/remoteproc/remoteproc_core.c  | 3 ++-
>  drivers/remoteproc/remoteproc_sysfs.c | 1 +
>  include/linux/remoteproc.h            | 5 ++++-
>  3 files changed, 7 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/re=
moteproc_core.c
> index f276956f2c5c..c4e14503b971 100644
> --- a/drivers/remoteproc/remoteproc_core.c
> +++ b/drivers/remoteproc/remoteproc_core.c
> @@ -1727,6 +1727,7 @@ static int rproc_stop(struct rproc *rproc, bool cra=
shed)
>         /* power off the remote processor */
>         ret =3D rproc->ops->stop(rproc);
>         if (ret) {
> +               rproc->state =3D RPROC_DEFUNCT;
>                 dev_err(dev, "can't stop rproc: %d\n", ret);
>                 return ret;
>         }
> @@ -1839,7 +1840,7 @@ int rproc_trigger_recovery(struct rproc *rproc)
>                 return ret;
>
>         /* State could have changed before we got the mutex */
> -       if (rproc->state !=3D RPROC_CRASHED)
> +       if (rproc->state =3D=3D RPROC_DEFUNCT || rproc->state !=3D RPROC_=
CRASHED)
>                 goto unlock_mutex;
>
>         dev_err(dev, "recovering %s\n", rproc->name);
> diff --git a/drivers/remoteproc/remoteproc_sysfs.c b/drivers/remoteproc/r=
emoteproc_sysfs.c
> index 138e752c5e4e..5f722b4576b2 100644
> --- a/drivers/remoteproc/remoteproc_sysfs.c
> +++ b/drivers/remoteproc/remoteproc_sysfs.c
> @@ -171,6 +171,7 @@ static const char * const rproc_state_string[] =3D {
>         [RPROC_DELETED]         =3D "deleted",
>         [RPROC_ATTACHED]        =3D "attached",
>         [RPROC_DETACHED]        =3D "detached",
> +       [RPROC_DEFUNCT]         =3D "defunct",
>         [RPROC_LAST]            =3D "invalid",
>  };
>
> diff --git a/include/linux/remoteproc.h b/include/linux/remoteproc.h
> index b4795698d8c2..3e4ba06c6a9a 100644
> --- a/include/linux/remoteproc.h
> +++ b/include/linux/remoteproc.h
> @@ -417,6 +417,8 @@ struct rproc_ops {
>   *                     has attached to it
>   * @RPROC_DETACHED:    device has been booted by another entity and wait=
ing
>   *                     for the core to attach to it
> + * @RPROC_DEFUNCT:     device neither crashed nor responding to any of t=
he
> + *                     requests and can only recover on system restart.
>   * @RPROC_LAST:                just keep this one at the end
>   *
>   * Please note that the values of these states are used as indices
> @@ -433,7 +435,8 @@ enum rproc_state {
>         RPROC_DELETED   =3D 4,
>         RPROC_ATTACHED  =3D 5,
>         RPROC_DETACHED  =3D 6,
> -       RPROC_LAST      =3D 7,
> +       RPROC_DEFUNCT   =3D 7,
> +       RPROC_LAST      =3D 8,
>  };
>
>  /**
> --
> 2.34.1
>
>
