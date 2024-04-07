Received: from mail-yb1-f172.google.com (mail-yb1-f172.google.com [209.85.219.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9ECC245957
	for <linux-remoteproc@vger.kernel.org>; Sun,  7 Apr 2024 23:21:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712532065; cv=none; b=GwzUb2m1tSKg6pQHFhmid5fer4X3q5iIUDvcLcIG5dUKx2aDh5mFMftFPZH2ay2rTPNEzmiZloWf7Xp4LVoybkBSeI4+yXNcQWiswVRQbcxkIPNozdYWgi1Z+qdBqfu1vTy8iFCJivlk9Dq5jAeYYSbWSYNQTq/S1jaxO+2AnbM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712532065; c=relaxed/simple;
	bh=IEUdhSdUgjvlpwgyNZ4LYZ53ohrtuhWv0xuI6yAt/Fs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=A8RsZFGvMr9IdfbYOScA3j+XGSN1xNX/rU8Iqh3phehmddLd2aS0KDVNG2H0V7jcqXrD7dHGHV9uC/UCf670A9neHeCu5kpiAmOoNxLVhFj6FMPqeW4BOJBuFDNJ7Oma9b8PwNQMsOl0nR745YeLQUs+zBP9ZsHLKT7OVbXv8aY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ndMjAsrE; arc=none smtp.client-ip=209.85.219.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ndMjAsrE"
Received: by mail-yb1-f172.google.com with SMTP id 3f1490d57ef6-de0f9a501d6so370948276.3
        for <linux-remoteproc@vger.kernel.org>; Sun, 07 Apr 2024 16:21:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712532062; x=1713136862; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=INbXO/IywSZ01YiAkrTP9R1xVbsCJ5iFlnEqYj1Y5vk=;
        b=ndMjAsrECXWAmZgbtG0r3ozpfc3A1FRAD9JE9VS6fME8jdMIvtuqW12bk95eHUaJMk
         WUXQdR8p8kC+wc6Q5uG+OeGZgFuVuo6wiB2vGRFCvIG70f++hydJa9Sgv2lOQ4j8A/af
         /sRQ5WXTJ4aSHzFYf5410skrgQuSdDN8q4T6diKgUgVxRyWnmbBXNr4wbnW0fSco2THD
         SuAoLSFTFtvFCo7Lh+g4xfDcPMGLJ9mlPLE/YnjoR+4S8idNxprk8M3sMK6S+c9fdlAt
         gZy0RwAwfs8MvR/Vx/HpQ6b6G1f9Dc0reCRjc+zAyDfRrPU0V4nnIB5eiIHsOq/v+mMe
         5gzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712532062; x=1713136862;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=INbXO/IywSZ01YiAkrTP9R1xVbsCJ5iFlnEqYj1Y5vk=;
        b=c3FuweaDPTmxsv/tXueiecdqZC8KpWV7mlLrA8hk7oUukGmyYSombEemc4vIlAuPS1
         2nbv2xOyvX6kNO+A1sn2gkRy4LOWp/V2dJb2LUEH+MiiKsvwyeGHjIgha8I37DxISt71
         g/6FeFD+HRNqR9xGvb1IKnEE01Kxb4LQmGG669hbKR2XONtsm3QoU8DXBjPE5o5CNVaJ
         r8xM+huf01zdwSSRVYVcj7t3rxh2zG4Z3Q97v/op6tkScvol237fwrYbvT6AUlDAUrK+
         KQUsfDM85vj7qK08EkNfuVbsqg2rQF39P4TCmJMsdqE2PwvPyeTnsIVsemm8+ZOZA0bL
         8QKA==
X-Forwarded-Encrypted: i=1; AJvYcCUQqEO6eIJnMWOK9U/kV3dDVUEHdqQNrqcPr9pzLMJwUar9COEipAtI4USVutGb7feFSe9LADH3NDvxdYK3s/G4WVJj7Y3W1BcnPS+Gc1ekbQ==
X-Gm-Message-State: AOJu0Yzdnt76IvOwaxjCzr/EypzfDMeuRXHA8TZ6ddbH+n3na5qMb/SJ
	tcUcgwtCa1QCvhErK9Ty/DQ0anYS9ukM6ZEoZ1yllGtovYju7k/9B5QqHLNtm3U2GRjd9AFNLVA
	3OKoXwkr+ncwdvtqWd0RieLg46bp02HrgZRwFrA==
X-Google-Smtp-Source: AGHT+IHKeKGfyVbi9maVV/SY7AiWTEn72HZU+S1B2Tfmdk/Ax3bzposxH0M2cu2UKmCqztxkV5xh8Kf5NPufiZbcJYk=
X-Received: by 2002:a25:8042:0:b0:dc7:4067:9f85 with SMTP id
 a2-20020a258042000000b00dc740679f85mr5732736ybn.58.1712532062573; Sun, 07 Apr
 2024 16:21:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240311-qcom-pd-mapper-v4-0-24679cca5c24@linaro.org>
 <20240311-qcom-pd-mapper-v4-3-24679cca5c24@linaro.org> <k5lgwpkfjjt257aq4tlux7lcke7v2euiegqi5mvevygizlvwo7@jg7f3e5rymmk>
In-Reply-To: <k5lgwpkfjjt257aq4tlux7lcke7v2euiegqi5mvevygizlvwo7@jg7f3e5rymmk>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 8 Apr 2024 02:20:51 +0300
Message-ID: <CAA8EJppBwmR+whFCPKtFt9XY2HnKHNu7Ua0w_y3V2COtxo=ULA@mail.gmail.com>
Subject: Re: [PATCH v4 3/7] soc: qcom: add pd-mapper implementation
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konrad.dybcio@linaro.org>, Mathieu Poirier <mathieu.poirier@linaro.org>, 
	linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, 
	Johan Hovold <johan+linaro@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, 8 Apr 2024 at 02:14, Bjorn Andersson <andersson@kernel.org> wrote:
>
> On Mon, Mar 11, 2024 at 05:34:03PM +0200, Dmitry Baryshkov wrote:
> > diff --git a/drivers/soc/qcom/qcom_pdm.c b/drivers/soc/qcom/qcom_pdm.c
> [..]
> > +int qcom_pdm_add_domains(const struct qcom_pdm_domain_data * const *data, size_t num_data)
> > +{
> > +     int ret;
> > +     int i;
> > +
> > +     mutex_lock(&qcom_pdm_mutex);
> > +
> > +     if (qcom_pdm_server_added) {
> > +             ret = qmi_del_server(&qcom_pdm_handle, SERVREG_QMI_SERVICE,
> > +                                  SERVREG_QMI_VERSION, SERVREG_QMI_INSTANCE);
>
> Sorry for the late reply.
>
> I met with the owners of the firmware side of this and we concluded that
> this will unfortunately not work.
>
> The typical case is that when the firmware comes up, it queries the
> information from the pd-mapper about itself, so this would obviously
> work just fine.
>
> Further more, if another core causes the server to be deleted and then
> re-added the firmware will wait for pd-mapper to come up. So this will
> work as well - as reported by Chris.
>
> There is however a not too uncommon case where the firmware on one
> remoteproc will inquiry about information of another remoteproc. One
> example is modem coming up, inquiring about where to find audio
> services. This inquiry will be performed once at firmware boot and
> decisions will be made based on the responses, no retries or updates.
>
> As such, starting pd-mapper with an incomplete "database" is
> unfortunately not supported.

Ack. Thanks for the info.

Xilin Wu has also reported a rare race condition seemingly between
pmic-glink and the pd-mapper.

I think I will rework the code to bring up the full database based on
the machine compatible.

>
> Regards,
> Bjorn





--
With best wishes
Dmitry
