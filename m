Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B12147F
	for <linux-remoteproc@vger.kernel.org>; Thu, 14 Mar 2024 00:10:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710375008; cv=none; b=rD/Y/y6xVDbkRao9dtHWaDoG/hFtFbNZCfivIF3On5HR4Ekt677+65wcRAvJxOgoLs0thneX0+1GcIinHhuaRjxjeBLKTRlR1QzNqUjVBcXzI5eb753kDL/KFXXvvJUeTf2q8yiFlxZSBIfMGqFtdIv/MU5NJnitGKX/Qe0kkjY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710375008; c=relaxed/simple;
	bh=ec22eP484v/AXC4kjGAAzrxbXX6N5ohUbSJGQR4ZIww=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IQzrAPcPsgZ4EUbnViVy0G9aEjFOXUCWHjg+bKc8iVJPDD4mYn75RByHXSzpPjP1Pjiqtplrfah9ONNJNJp6Y4rtYa58S7BenXVTrIfj0Z08ZTXTmX6E5cFhfAI+mmRW8d8Vhvb31OSYOkfRyuIICirL7taxAg7Kl00L1f8e9rA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=u16ou+af; arc=none smtp.client-ip=209.85.128.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="u16ou+af"
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-609fb19ae76so4664627b3.2
        for <linux-remoteproc@vger.kernel.org>; Wed, 13 Mar 2024 17:10:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1710375005; x=1710979805; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=CObZLoh3uZD+J/vo9QTXq7jAF93NORabu7T4LEk61OA=;
        b=u16ou+afCsS//aOvI4TUCfbvIE4N3YjX22Z8wjGF48YzCR2Y0+iewqF0a/tA8H1YnK
         J6zsPBl5dq/iWLt8YKPNd40smMZPiUbEucsXwxb15DegwdAbZAzs2o8i0ClyTvNfCQGD
         sK+crNRtpG5WZgWDOBnrAg0AkMAYdnNFPB8k+VkHpepVda64QFytdmpAcwiY0mmjAZ0d
         KIp1M9gYaRR6S3GCLvoQfNiia2zxLJFUSEf9ArxgRzHkz4mvga1mfBScHFlOP1LI9zss
         6kJzstzLO6TOfR+Wy+3padlad86z6If+ENRXSmbtVtbfKNF/BIklc5pGK5jANP+1x8zz
         GACw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710375005; x=1710979805;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CObZLoh3uZD+J/vo9QTXq7jAF93NORabu7T4LEk61OA=;
        b=gQunUTTly3m9FhjDya9m+V53D9+mJQJ/jU0+TchDiM4Z6nP6WpTzrNLhoI1hEO4KjI
         G8szoRee2iWYuAdgE471/IRL19/dI//xPsP968ZVDPyeBHVMakN366Fn4Ods1IUGQCN1
         Tnf9zhBqxFYsm73wAl2dFuW1xtwh2nriR3zn72dIGfa9ffkaqkrMPSNUgI2kENRAQ+ga
         uAKPQU0H4f4mYMFtiW5bqic0ZKjvJbsbrAs8xPddX+jGpaqPl2050tfK68CJQnfXyB1x
         BtCdGhCVKR54noGqFhd4TaNwTnlk7MFfpkZdLAC+v6ZlWQJ6F8B2DntJl14Ym1M3o7gF
         iEsQ==
X-Forwarded-Encrypted: i=1; AJvYcCX3KjL5iF37qKKrAgfKLh8RIINB04lmWQ2ZsEB+lHmBW4EqUe8fRWZFoE9+wZ6/VN0/1FaxMdMsq6/J1iWh0E4vg5AJR5MgkhYJDX8E4DQOKA==
X-Gm-Message-State: AOJu0Ywc9+2Ag+EFP5NswZBCnjhaazUWqV2Und7Di/wDrRdsGtLcj4Ay
	QQfCqvPwmPzExh+ycR1U2NakcURy4cTlwgpEezeEagvp1QcOrFJegFnORkT2dt+KJrZunpW4w0k
	vvJ5cmfgHVXnbt6O1iWtFhiuQCHueU3Y/ZKnHNw==
X-Google-Smtp-Source: AGHT+IHdrgV0AmpnXR7NivcZfh9QuBWnkGN4Tif18Aw8PrgVxPSxQyie2ULwkB9RBOYiLqqC2uWDaTku/4dWuExCB8k=
X-Received: by 2002:a25:b7c2:0:b0:dcc:6112:f90d with SMTP id
 u2-20020a25b7c2000000b00dcc6112f90dmr262699ybj.62.1710375005672; Wed, 13 Mar
 2024 17:10:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240311-qcom-pd-mapper-v4-0-24679cca5c24@linaro.org>
 <20240311-qcom-pd-mapper-v4-2-24679cca5c24@linaro.org> <9785a6e6-3700-0b89-b4b5-7981ed5bdd38@quicinc.com>
In-Reply-To: <9785a6e6-3700-0b89-b4b5-7981ed5bdd38@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 14 Mar 2024 02:09:54 +0200
Message-ID: <CAA8EJpr0vV4THO=+rNTXmK5YJtQwzfcsWCWHUgU1XaiSEudtsA@mail.gmail.com>
Subject: Re: [PATCH v4 2/7] soc: qcom: qmi: add a way to remove running service
To: Chris Lew <quic_clew@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Mathieu Poirier <mathieu.poirier@linaro.org>, linux-arm-msm@vger.kernel.org, 
	linux-remoteproc@vger.kernel.org, Johan Hovold <johan+linaro@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, 14 Mar 2024 at 02:03, Chris Lew <quic_clew@quicinc.com> wrote:
>
>
>
> On 3/11/2024 8:34 AM, Dmitry Baryshkov wrote:
> > +/**
> > + * qmi_del_server() - register a service with the name service
>
> s/register/deregister/g

ack

>
> > + * @qmi:     qmi handle
> > + * @service: type of the service
> > + * @instance:        instance of the service
> > + * @version: version of the service
> > + *
> > + * Remove registration of the service with the name service. This notifies
> > + * clients that they should no longer send messages to the client associated
> > + * with @qmi.
> > + *
> > + * Return: 0 on success, negative errno on failure.
> > + */
> > +int qmi_del_server(struct qmi_handle *qmi, unsigned int service,
> > +                unsigned int version, unsigned int instance)
> > +{
> > +     struct qmi_service *svc;
> > +     struct qmi_service *tmp;
> > +
> > +     list_for_each_entry_safe(svc, tmp, &qmi->services, list_node) {
> > +             if (svc->service != service ||
> > +                 svc->version != version ||
> > +                 svc->instance != instance)
> > +                     continue;
> > +
> > +             qmi_send_del_server(qmi, svc);
> > +             list_del(&svc->list_node);
> > +             kfree(svc);
> > +
> > +             return 0;
> > +     }
> > +
>
> is list_for_each_entry_safe required if we stop iterating and return
> after we find the first instance of the service?

Yes, it just adds a temp variable here.

>
> > +     return -EINVAL;
> > +}
> > +EXPORT_SYMBOL_GPL(qmi_del_server);



-- 
With best wishes
Dmitry
