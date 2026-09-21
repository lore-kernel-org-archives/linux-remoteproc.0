Received: from mail-vs2-f40.google.com (mail-vs2-f40.google.com [74.125.227.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D498486B90
	for <linux-remoteproc@vger.kernel.org>; Mon, 21 Sep 2026 11:18:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.227.40
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789989528; cv=pass; b=UpsU1X5jJIYgB5QkeQk/ZkzEcY45qRbar3t+SbsfbNC/fn/I4tZ71N4VHGZkV2ASijj1aga6jPacPsyVDlf0wbrSOm0PiipmPSvQrL7yqXthRYUwawl/baCgk+KHZ+fAA49mHUA3OjlZYNHO8G2WQW0rAt8bsbKhiaGX6pRc+e4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789989528; c=relaxed/simple;
	bh=UiU20cy2YdW0ZLpH/v4KpY+lU5CRR3LTrFWqHV5tSfQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NaiXfUN61o30GypqZGCCkEFLYwRnyXHyZKAnoxvIZs5L2hIgdRw4sY62JxTod1YZ44/+Xf8uH16jDTDCS5mg6dgXKvMjzcFBcdz0cftQGAgSjzw9gBvd90X+q+Ub6lPSkZJXCy9O3SoJufpUstTgOpfEe8fAR7M3cK88YG2QXS4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=C+UKQ/xV; arc=pass smtp.client-ip=74.125.227.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="C+UKQ/xV"
Received: by mail-vs2-f40.google.com with SMTP id ada2fe7eead31-79de8079842so106647137.3
        for <linux-remoteproc@vger.kernel.org>; Mon, 21 Sep 2026 04:18:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789989523; cv=none;
        d=google.com; s=arc-20260327;
        b=T0KtAzC1B1iKvLgY95LWCiRE2Ha52VY/SXJUtk0T38/dk0pl3tIZLwS1ufyNWU+kML
         cs3jPBE/I2EJhcor4qcSpnLvDnJD9OshANxnGnjViqKFY+iAvgNYbmxtXx2Lm+/2K4bO
         BOK424tARHEussNMp2VVPEGBNhx57AcOCcJlcC1quL+4E8Wf995sWXXpynQyAJXKcynj
         HOz1o5xwILW1Qc4CEG6OS5Ea7600kaZs94lIqDScPMi0n2YD+KlaFePQ3g5BT0snTONw
         +ps5+JuqMhaY0Pvf6uftxofP6139WJZKoYWucGsYjo6f+RrUYdD4XnPH1Wbw12BS86XD
         uaag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=typTlZLGLU0ycb4Q1T8ES1fBQnZmU7G5zzKl77tNR6w=;
        fh=BPKB+g6Kx2gzLkcA3r/pSkRYECdtBDqv//pSkiYgo0s=;
        b=meu7e5hGm53cf8/Xt6zmEPw6QAkhaNAlLEeQz8pkBG361kRGullg6u7emgmlutFFEN
         fZ4nEe0mk3FJ8cogZGgVEs+4h2gjLJ+QWEesuUW04dq2CmHTrvFPZOfaxvApyXZAQMlk
         iddcpRWpoAsWrE7q0xerqaWnDUHtfSZ9FLgTCSa78PNNxH4PfyHFJy4W4SX35r4Mq4mQ
         7I3ZNg0KqNmCcgnrRiQ1t31ecGSQCFaEazm0nJmxxVgz9Ep8mv+StBrMyfk3+SrDXOI2
         E3iTmvFpnKj9wEf5vxca0i/eBoa8FBmWDDjah7DBBggl/AG6A3Zw3Yj4AASRNblv9oxq
         pslA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789989523; x=1790594323; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=typTlZLGLU0ycb4Q1T8ES1fBQnZmU7G5zzKl77tNR6w=;
        b=C+UKQ/xVwnK5kj0/f67rZdxhFz6nrbXVmkVPybh0Ie0LfvBQ20w2wkp4n4J6HpSldE
         NTeD5LErsyFet2bTX+ufz3gKopvmkkNn1foQjqJfVY30sEAoJhqTNNtrenNb74BVk9O0
         gryyXr+qV14EACci82f123b2HMJbGQ1fnAXfE7w1aA4RcSlpq6RVqwrKCoR3wiPCeIKk
         XEd2Ltv9ueorhmbmeOA/Xst/CS7yo+IPFPcWg+ZlKD9evniG9LY/Dnhbc1VE9E32sGOX
         ZLUclRgeFRVBaaZw9x7Y0+QXpazPzSL4KuL56a+48eENCrG0L5x7wW86Bxv6KBYEtPME
         o1yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789989523; x=1790594323;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=typTlZLGLU0ycb4Q1T8ES1fBQnZmU7G5zzKl77tNR6w=;
        b=w0o/FVTrBlBHxOyzx16/A/8PhColibKgeV6Pg8PJLEraE5tPbObDWhKsywXf4VybWf
         eiknBLI2bCvlnu89qD5/2PofUhLAwl/sgAKDlLN+pV66aIgs/btcrf2UvgAgCagpysHp
         R36whOEOTmKMBoC1Wp/KqBsxEyU5Jjnx2meFAPc+e+flsFRMpXVwM3IzsUaYd37AZwlj
         vAMVe8VYWIDVcHegaZ1p6L7q1NYyLkeblX2XmoMXbQRAjAqBu/A9P4svFM7/O6sXAHD5
         StVapn7agg1Nwr0eQme95M4CPWyeSfygGSmElxCN1jjvl8yqfxiMtvNi+Z+R8cx4qQa4
         XfLA==
X-Forwarded-Encrypted: i=1; AKwUvBzJSJQqttBDRhwcpnfZoreTBiwFXhuJFRQtCFfgALdW5sYpWB9ylvy+hxmzFsIDDpaUHK4sSGcJ8ZKKDFc7C0TG@vger.kernel.org
X-Gm-Message-State: AFuF++m55DjiQvE6LMGl3O5LnKVEy4s3iD6VqMXyckxJAncXCtR/iYEI
	K3Q+PG4mcuoJrLcH3OoX8C4rbzsMsEnaqTZYt44Q0wxE48cyNOzBObi4SiwVqoNCVgb5UyxVQXC
	LIzebms/ShkGh60RL32+AtE/LncU5/1U=
X-Gm-Gg: AYBFou36eyxjmwnJpc9nTqxL1E9GN9+q38XCoKISCMOeidtj92trwWJGNd9NwV+lQPa
	LJBWxqyODkywVRTOLWHXoul6VUrBFrIaHlcf+U/nBDp2Gn21paO+k0cW/wXAy95WEr4Q827QN13
	8Fhn1HlSJiBexTjHzVybpDVVCNdadzrbRV9lSneCUtYa6A9fb4dBzqICpOYrWeEecNhuNCDuien
	BLGZV2D/XD6/cLXSR2s2MUb9UeBIH6vIvil+6hyGD2BVR81S/snJRS4CRfWxYvW6L4CxPGVI5Ti
	vDbS/aDFYzTFZ7zfo25+pcn0GDTlW2d43erBHVfiR/4io9fOh4mvpMpFIA==
X-Received: by 2002:a05:6102:8485:20b0:7a6:81f4:ed45 with SMTP id
 ada2fe7eead31-7a681f52721mr1746808137.2.1789989523325; Mon, 21 Sep 2026
 04:18:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260710194638.1502-1-saileshnandanavanam@gmail.com>
In-Reply-To: <20260710194638.1502-1-saileshnandanavanam@gmail.com>
From: Sailesh Nandanavanam <saileshnandanavanam@gmail.com>
Date: Mon, 21 Sep 2026 16:48:32 +0530
X-Gm-Features: AcwNN1WXDzMOYUpzBsDst8BavH57bPBz6X3QLpTNZ3TRbxpATk86bD8mnynpp8Y
Message-ID: <CAF+TLO0+snqqrrU_h-psciUmX3e4447opf9o0vEhuT8CTrDn9A@mail.gmail.com>
Subject: Re: [PATCH] remoteproc: qcom_q6v5_mss: Fix off-by-one error in
 regulator error cleanup
To: andersson@kernel.org, mathieu.poirier@linaro.org
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
	dmitry.baryshkov@oss.qualcomm.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Bjorn, Mathieu,

Gentle ping on this patch. It has Dmitry's Reviewed-by from Aug 18,
and Konrad's question in the thread was resolved.

I noticed Anup Vishwakarma posted a patch on Sep 16 for the same
off-by-one in q6v5_regulator_enable(). Mine was posted earlier
(Jul 10), but I'm fine with either being taken. Please let me know
if anything else is needed from my side.

Thanks,
Sailesh


On Sat, Jul 11, 2026 at 1:17=E2=80=AFAM Sailesh Nandanavanam
<saileshnandanavanam@gmail.com> wrote:
>
> In q6v5_regulator_enable(), when any operation fails for regulator at
> index 'i', the error cleanup path unconditionally calls
> regulator_disable() starting from index 'i'. However, regulator 'i'
> was never successfully enabled at this point, resulting in an
> unbalanced disable.
>
> There are three distinct failure points:
> - regulator_set_voltage() failure: voltage was never set, load was
> never set, regulator was never enabled.
> - regulator_set_load() failure: voltage was set, but regulator was
> never enabled.
> - regulator_enable() failure: voltage and load were set, but
> regulator was never enabled.
>
> Fix this by introducing three separate error labels to handle each
> failure point correctly. For the failing regulator at index 'i',
> only reset the resources that were actually configured, without
> calling regulator_disable(). Then roll back all previously enabled
> regulators using 'i--' in the for loop initializer to skip the
> never-enabled regulator.
>
> Fixes: 19f902b53b47 ("remoteproc: qcom: Initialize and enable proxy and a=
ctive regulators.")
> Cc: stable@vger.kernel.org
> Signed-off-by: Sailesh Nandanavanam <saileshnandanavanam@gmail.com>
> ---
>  drivers/remoteproc/qcom_q6v5_mss.c | 16 +++++++++++-----
>  1 file changed, 11 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/remoteproc/qcom_q6v5_mss.c b/drivers/remoteproc/qcom=
_q6v5_mss.c
> index ae78f5c7c1b6..9a17aa065f50 100644
> --- a/drivers/remoteproc/qcom_q6v5_mss.c
> +++ b/drivers/remoteproc/qcom_q6v5_mss.c
> @@ -311,7 +311,7 @@ static int q6v5_regulator_enable(struct q6v5 *qproc,
>                                 dev_err(qproc->dev,
>                                         "Failed to request voltage for %d=
.\n",
>                                                 i);
> -                               goto err;
> +                               goto err_set_voltage;
>                         }
>                 }
>
> @@ -321,20 +321,26 @@ static int q6v5_regulator_enable(struct q6v5 *qproc=
,
>                         if (ret < 0) {
>                                 dev_err(qproc->dev,
>                                         "Failed to set regulator mode\n")=
;
> -                               goto err;
> +                               goto err_set_load;
>                         }
>                 }
>
>                 ret =3D regulator_enable(regs[i].reg);
>                 if (ret) {
>                         dev_err(qproc->dev, "Regulator enable failed\n");
> -                       goto err;
> +                       goto err_enable;
>                 }
>         }
>
>         return 0;
> -err:
> -       for (; i >=3D 0; i--) {
> +err_enable:
> +       if (regs[i].uA > 0)
> +               regulator_set_load(regs[i].reg, 0);
> +err_set_load:
> +       if (regs[i].uV > 0)
> +               regulator_set_voltage(regs[i].reg, 0, INT_MAX);
> +err_set_voltage:
> +       for (i--; i >=3D 0; i--) {
>                 if (regs[i].uV > 0)
>                         regulator_set_voltage(regs[i].reg, 0, INT_MAX);
>
> --
> 2.34.1
>
