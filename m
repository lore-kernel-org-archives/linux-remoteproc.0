Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com [209.85.219.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36C4716DEC2
	for <linux-remoteproc@vger.kernel.org>; Thu,  6 Jun 2024 09:15:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717665355; cv=none; b=HuU0uVXNUq2kZVF6Yo9MUZVHbw2+Uy+mLjmM2vIJ9n/gsB+bDZaYJmddvfviRrbqYYm1M75/w9+Gf0drFhWGgzzJ/HrziBHZ6llCn4qVK0CbpBZrhV/IyXEg2H6HoEWMpV/r8On7OBAp2UE7fwkCZ9QEOJOFKMjR52/EQPoh06E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717665355; c=relaxed/simple;
	bh=d5VEawcLl8UDk3zRsblTLwZtFlWswsdJ90/lMO/E4z8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VwE/UyZya6gQYCF1bk6r64XbUMj7QYT3UJvSicq8S+z06Wp1O0G4LL9hi3WSbc3/BUKanxc6botohNXzFum+WxnAPjlwJNaqFyLNsD5sisKkZ0U3fEikLDOd5JrT7P/6scDEwou32a7n/C0F6U4D56vXlorXvUW8Vpxfj1Mn3js=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=HShYZLVa; arc=none smtp.client-ip=209.85.219.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="HShYZLVa"
Received: by mail-yb1-f173.google.com with SMTP id 3f1490d57ef6-df771959b5bso787729276.1
        for <linux-remoteproc@vger.kernel.org>; Thu, 06 Jun 2024 02:15:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1717665353; x=1718270153; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=prCgKOu5xUqPviI6q3QieUy9Xde2OWUNUz9QeXNcL0E=;
        b=HShYZLVaTXsLeDbz3chnzhFAk5/Zd/bulEY4k9uD7ihTZuQSrVJXlle2xr4eDzd1oC
         gtZecySk4PABzYM4/x7j6hkOHpXIH5Sd78kRiqfWgZIcXpMMW61iekqbaug6AJm4mqQ1
         ZSOHk9Sjo8oa5UDUgf1hIVMd238qNZjdNzn/uqzQ7NUEZce9RknphA2qcbgG9n3oNACB
         1+Z6yxirvZ3hfrMLPzXGQMBiaTnLTpj4eP/1fUfXitcJYhaMnPwxhOzE8ZXqD8kJXux8
         gYAj9DR+MGTyCuvGan38MBNuy7AoALmk363IlatT/hC0stFSmTisdr6dtnGpz8oyXYo/
         xbAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717665353; x=1718270153;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=prCgKOu5xUqPviI6q3QieUy9Xde2OWUNUz9QeXNcL0E=;
        b=dOzZJ0ep/dA006xfjyUvffS5PemRtBRglLtlIMyYRIkLW0+5cmN1CLvHzoE4IM3ogO
         AMMPubDd6Crb76vlytAqJeY1eDzgLHhy3gJ0gXdPTQqH3Nih1Db2GH9CtDm9IyEmgCs7
         I1n9A1QvhlMBYkKE56AyL7mjSscmqfuyBcppQuPk2bU/qCAHnZAyBW0x0J3iXUVVc3tO
         LQ5gxn/JBAhFleZ0IKrQ24Ir4dMFH/pShz7WHDaOANl8lJ6trnYCAuDvqzPDqS/LN8HJ
         B/h33CTPYzHnIl/2lRNh8IkqCwiRUcSE1wkkOk7Kh0n4FiK+/DBcCRgCQGfWwTMUdEgd
         OLSA==
X-Forwarded-Encrypted: i=1; AJvYcCVc/SSIDXloQVYA6WtdGMDlAZ7Syqa9qDztGuRxe9Tfpp2ib2JWnT48F6+5f/oKutWO3HNjHEDRkGpkTnskBCbUQ5GEheSBXYIP5Lt4aeD68g==
X-Gm-Message-State: AOJu0Yx5VngV4WGILgicQNP3DeEy4jaawrmrQwKDRa3T5Owl8gScJfPa
	UNVQId2O/BencuNcWdO2q0IPxDWyLIpM7MMzPSfK/zVqQA+asoynC9s36qrYL7LJgPtMSKxuzVb
	ABXzjzeMG4MjaFUruKVRx/VgbhgfU2x0RHUKM3A==
X-Google-Smtp-Source: AGHT+IFaOcdlZ5nCXl1l45Vkz1KaX5b/tqrF4gcmtPHSaXfhREsd/1VHIFL+r38k8LV70RRVuJHpKDl31AeNkyXGeHM=
X-Received: by 2002:a25:2c2:0:b0:dfa:4936:e617 with SMTP id
 3f1490d57ef6-dfacad00050mr5096794276.48.1717665353113; Thu, 06 Jun 2024
 02:15:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240512-qcom-pd-mapper-v8-0-5ecbb276fcc0@linaro.org>
 <20240512-qcom-pd-mapper-v8-1-5ecbb276fcc0@linaro.org> <d9a2004a-0a3b-41a6-92a4-eea7b1b3f804@quicinc.com>
In-Reply-To: <d9a2004a-0a3b-41a6-92a4-eea7b1b3f804@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 6 Jun 2024 12:15:41 +0300
Message-ID: <CAA8EJpq=vuvWMcPf65nezDXFmWjhwMziuMzVtSDiM81_HD5UMA@mail.gmail.com>
Subject: Re: [PATCH v8 1/5] soc: qcom: pdr: protect locator_addr with the main mutex
To: Chris Lew <quic_clew@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Sibi Sankar <quic_sibis@quicinc.com>, Mathieu Poirier <mathieu.poirier@linaro.org>, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-remoteproc@vger.kernel.org, Johan Hovold <johan+linaro@kernel.org>, 
	Xilin Wu <wuxilin123@gmail.com>, "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>, 
	Steev Klimaszewski <steev@kali.org>, Alexey Minnekhanov <alexeymin@postmarketos.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, 6 Jun 2024 at 01:48, Chris Lew <quic_clew@quicinc.com> wrote:
>
> Hi Dmitry,
>
> On 5/11/2024 2:56 PM, Dmitry Baryshkov wrote:
> ...
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
> > @@ -365,6 +365,7 @@ static int pdr_get_domain_list(struct servreg_get_domain_list_req *req,
> >       if (ret < 0)
> >               return ret;
> >
> > +     mutex_lock(&pdr->lock);
> >       ret = qmi_send_request(&pdr->locator_hdl,
> >                              &pdr->locator_addr,
> >                              &txn, SERVREG_GET_DOMAIN_LIST_REQ,
> > @@ -373,15 +374,16 @@ static int pdr_get_domain_list(struct servreg_get_domain_list_req *req,
> >                              req);
> >       if (ret < 0) {
> >               qmi_txn_cancel(&txn);
> > -             return ret;
> > +             goto err_unlock;
> >       }
> >
> >       ret = qmi_txn_wait(&txn, 5 * HZ);
> >       if (ret < 0) {
> >               pr_err("PDR: %s get domain list txn wait failed: %d\n",
> >                      req->service_name, ret);
> > -             return ret;
> > +             goto err_unlock;
> >       }
> > +     mutex_unlock(&pdr->lock);
>
> I'm not sure it is necessary to hold the the mutex during the
> qmi_txn_wait() since the only variable we are trying to protect is
> locator_addr.
>
> Wouldn't this delay other work like new/del server notifications if this
> qmi service is delayed or non-responsive?
>

I've verified, the addr is stored inside the message data by the
enqueueing functions, so the locator_addr isn't referenced after the
function returns. I'll reduce the locking scope.


-- 
With best wishes
Dmitry
