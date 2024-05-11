Received: from mail-yb1-f172.google.com (mail-yb1-f172.google.com [209.85.219.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F76F225DD
	for <linux-remoteproc@vger.kernel.org>; Sat, 11 May 2024 21:52:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715464356; cv=none; b=p9HSHQIv7FAMMTvGhteA8lPKzp3R5fV3JhCASV+yRgZ59sZH/zUCG6uPIUZPmsABpFf2yKyFARKst55Nyc4k5ypIuDowY7le0DnHpscSIf/4hI2nNwhlAnOYK/TuGpvtauoX7DcdUxz9AKQmji8QwarbfLaqkH6aci/Xh+0EhKU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715464356; c=relaxed/simple;
	bh=pf2wv3ydNosYB79zDqNVaK/3uio46So1rqMJdd2CbYs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jjBuOUjaWt3jzNatHoY+Xc6sNcawRf61zMqqnXudxM1Ll31heeG1L1t3ok96osQDBGuRfmXxh8jzTkxJ/pPXGjwpKwXAZU+6VveUqGDSvZ+S5QayjYPoWwHPqUKbak4QcpQtAmjaQ70H7wYKY2I2AzUhtX89HB5r9tVvKZTmhHI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=QZQg8ESO; arc=none smtp.client-ip=209.85.219.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="QZQg8ESO"
Received: by mail-yb1-f172.google.com with SMTP id 3f1490d57ef6-de462f3d992so3331016276.2
        for <linux-remoteproc@vger.kernel.org>; Sat, 11 May 2024 14:52:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1715464354; x=1716069154; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=3wjcDK8yOGJQ1DL5gQpu62cFA/q24UQrr/Gt9NCzNO4=;
        b=QZQg8ESOWSVHHYo4whpb7togbVaxNZW44I8prsjZkSHzoboiF0wKNZHaZCxKF8yNaA
         gPJ8baF3RvhPuDhLr2IEyPS2mg77sYVTSI5PnAd3hUhyJUsmWMeYMhivhh2c8d+bjetz
         F8MSGhvhxSesHVi9SOnmJvhEHptQQSyRH6lUjoujMRS7it6cCU+qiqX1QaEMSB9gNM1m
         90EiLyOTRvGIkQSEtsKRg/mzARoh0DkAdYiTpK8zkpaYA5Q8knXB1yhSp5b0/FbjNDuW
         HFp2gp1wEkpnSDCNlRFGpN1/JWYBjBsnyLKx8D7njMnMzOEGjx48f3GV1Nq/bx9xRvVX
         TugA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715464354; x=1716069154;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3wjcDK8yOGJQ1DL5gQpu62cFA/q24UQrr/Gt9NCzNO4=;
        b=j/MTA+MaGbo0RBouQviS0hccSuzep2bFG3wvfDTJhaEo+eTNv6dWunDm8YaujARoov
         6sn2Ys/MctvG8M0KoLFCsClot0RH0MinbkhKB6Z7q6rTmrJF8P4PcalAK6z/xgTTkgVK
         KUr4DIJDyQBRGoUTdpQcFeUT80BZxcH2HUOFf/TK3632QV4+jH5Nr43lN68dBCCefVzj
         Sl4Gjfj/xXFryF+b2uynfOqCWgLu7omfXdCL7WwYOMRjHu/dUVOIbYxczlQffeyNjH3J
         N2ewFux9N5hnRZNsmoZMByZCdM3xO0CJtFXbfLpWU0gqF2IBXDrj2h8Y3OAGFxYK7exd
         e/IQ==
X-Forwarded-Encrypted: i=1; AJvYcCULNLpTqWjnTfoLbOtm4ayWadf2jKuNo0buMeo7o/1jM4FDHmVfccJYDOlC5Z7vryqiznZ2105RTcL6sXEuiN10SF6N7cTQ0JTOJRMM+uNiRg==
X-Gm-Message-State: AOJu0Yy+TQgJwJmtxYlC4g67MNU25YKv+BZe11u0htN7lLgCx2weri9H
	kIucJ3ZDAcYpoGJMH7aaP32ICcERdwtzekgoGeEFjGLLwOJ2AX7fDzJFjWFQ9jLcFo/DTM5En8O
	28Wlqa+y2TkhtIDCKegryw0JSvPHxJDZQhd73cA==
X-Google-Smtp-Source: AGHT+IGb9x1QQvEQJcSjuug3d3oh9EExYyyZS6CzAQ25nIfZV+w1kS2+mukgZH63N+DVDr7JXiU7C6btr0dNzo9vHeo=
X-Received: by 2002:a05:6902:28b:b0:de0:f74b:25f3 with SMTP id
 3f1490d57ef6-dee4f3961dcmr5392619276.60.1715464354013; Sat, 11 May 2024
 14:52:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240424-qcom-pd-mapper-v7-0-05f7fc646e0f@linaro.org>
 <20240424-qcom-pd-mapper-v7-1-05f7fc646e0f@linaro.org> <d71c677f-eff7-2bc4-4328-38e4d83e1115@quicinc.com>
In-Reply-To: <d71c677f-eff7-2bc4-4328-38e4d83e1115@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sun, 12 May 2024 00:52:23 +0300
Message-ID: <CAA8EJpoNQy682GDfWZpKz2McE=ho0YQXperE2Mi1Wk=OFkJb3g@mail.gmail.com>
Subject: Re: [PATCH v7 1/6] soc: qcom: pdr: protect locator_addr with the main mutex
To: Chris Lew <quic_clew@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Sibi Sankar <quic_sibis@quicinc.com>, Mathieu Poirier <mathieu.poirier@linaro.org>, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-remoteproc@vger.kernel.org, Johan Hovold <johan+linaro@kernel.org>, 
	Xilin Wu <wuxilin123@gmail.com>, "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, 25 Apr 2024 at 22:30, Chris Lew <quic_clew@quicinc.com> wrote:
>
>
> On 4/24/2024 2:27 AM, Dmitry Baryshkov wrote:
> > If the service locator server is restarted fast enough, the PDR can
> > rewrite locator_addr fields concurrently. Protect them by placing
> > modification of those fields under the main pdr->lock.
> >
> > Fixes: fbe639b44a82 ("soc: qcom: Introduce Protection Domain Restart helpers")
> > Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8550-QRD
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >   drivers/soc/qcom/pdr_interface.c | 4 ++--
> >   1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/soc/qcom/pdr_interface.c b/drivers/soc/qcom/pdr_interface.c
> > index a1b6a4081dea..19cfe4b41235 100644
> > --- a/drivers/soc/qcom/pdr_interface.c
> > +++ b/drivers/soc/qcom/pdr_interface.c
> > @@ -76,12 +76,12 @@ static int pdr_locator_new_server(struct qmi_handle *qmi,
> >                                             locator_hdl);
> >       struct pdr_service *pds;
> >
> > +     mutex_lock(&pdr->lock);
> >       /* Create a local client port for QMI communication */
> >       pdr->locator_addr.sq_family = AF_QIPCRTR;
> >       pdr->locator_addr.sq_node = svc->node;
> >       pdr->locator_addr.sq_port = svc->port;
> >
> > -     mutex_lock(&pdr->lock);
> >       pdr->locator_init_complete = true;
> >       mutex_unlock(&pdr->lock);
> >
> > @@ -104,10 +104,10 @@ static void pdr_locator_del_server(struct qmi_handle *qmi,
> >
> >       mutex_lock(&pdr->lock);
> >       pdr->locator_init_complete = false;
> > -     mutex_unlock(&pdr->lock);
> >
> >       pdr->locator_addr.sq_node = 0;
> >       pdr->locator_addr.sq_port = 0;
> > +     mutex_unlock(&pdr->lock);
> >   }
> >
> >   static const struct qmi_ops pdr_locator_ops = {
> >
>
> These two functions are provided as qmi_ops handlers in pdr_locator_ops.
> Aren't they serialized in the qmi handle's workqueue since it as an
> ordered_workqueue? Even in a fast pdr scenario I don't think we would
> see a race condition between these two functions.
>
> The other access these two functions do race against is in the
> pdr_notifier_work. I think you would need to protect locator_addr in
> pdr_get_domain_list since the qmi_send_request there uses
> 'pdr->locator_addr'.

Thanks, I missed it initially. I think I'd keep the rest of the
changes and expand the lock to cover pdr_get_domain_list().

>
> Thanks!
> Chris



-- 
With best wishes
Dmitry
