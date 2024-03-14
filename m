Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D384B38F
	for <linux-remoteproc@vger.kernel.org>; Thu, 14 Mar 2024 00:07:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710374876; cv=none; b=D5mAt9D12RyeyTtQPC29bqBQRM2l3hD4CH2gQ6rIHQ5HhxuFIX55EMEoyni6L0/GxnpcNi+lP4u4q5BozuavtUGnh7BVz1fOKNq7m93KjHmWOkcyRZD+M8m+3C4dE7koGP7CkKp+Gsie3G5UJpSfc0p19irIxRCpqGpYbqNAK5Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710374876; c=relaxed/simple;
	bh=ffR1KLBN3MQHUEkttzvPMlq1F8KNOPWL1lKUyDg5C5Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tNW3LedakChf/6A50efctRZQOsH0dYwkjAHljxH3g868Jp05X+cywknvScF0uBilPK/zvBCz0R9vg/+dMqdKMpLQHuNPjzDJSPuL+Wn3MOHw+MKa4WyJD6wCy+cAhA9Gc5LqjsWFxb/bRwjedlQPtWRflRLRCSKRXaxkCrktpLY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=SlczfVgz; arc=none smtp.client-ip=209.85.128.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="SlczfVgz"
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-60cbcd04de8so3906767b3.0
        for <linux-remoteproc@vger.kernel.org>; Wed, 13 Mar 2024 17:07:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1710374874; x=1710979674; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=zhMl0zbJ/9Le9atsjgFlR3I0eu5p7IGZRFyK29oqUiU=;
        b=SlczfVgzucTYqb/mgSLIrUbdPeIznQq39I/O34lAvJZ7X4bVSO35nW+XNDsmecOVMD
         RNld8Apb3trYhO7E0OTQEyd8SWOpp7fbBfxDWEuiTX5jHwoH3KG1dMo2RbF1RktygKXC
         3KunpduGlCZ8jAcWFy4vlAgvHBfELvNSgpU4Ar3566V3jAjOtk9C/xl6iiN516TMc1SE
         E2xXyyECsbdkDGW1gK3uByIxGETTW5UVGA/i1sTeuX6CPtGJXKsJNV/doAsfM4fHYooC
         YbeCc3G/AtrTjPWgcupqpLbPQBan1/A8vVWN8qfqsBlN9kKwaJ0vIFOiQiNJLHkhs+2d
         TVRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710374874; x=1710979674;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zhMl0zbJ/9Le9atsjgFlR3I0eu5p7IGZRFyK29oqUiU=;
        b=aFlh0JKzrDW4i3ytyVYh4+bOhVS6AXq5/NF2dVPnkuiWOL456unkCnJTIeYP+dhGEW
         /XHbK2IvaEDgLatYhqO9ybg5VjxA8pToNrr77wD/Nu1wIOZZW96DyMjfM88mlUtyZwNK
         OnNTd+2cbYzbLOiGzbdUQXG2iFatbZGi0uaDLqSSki1bDrU+jYZY8B+aUeGsjjIZ9wmN
         ca0sQgh8ChSFCbm5NKmpdkqCRyCo+FxA8siIHEambjOg/hzPGPoJSHuTer1QBBj6uM4o
         L2B4UKqh1p5dFAZJ8ccK0A1OZPc9nk5eApCupdStb4v33UHOffsvsTRf0fyu9/WpjJVH
         ScdQ==
X-Forwarded-Encrypted: i=1; AJvYcCX+FV/CDrURsHeuW7fmQ/n2RzHh6uCk4lqXvIZJ92phahhQP4mbpdQKiXloa9Q9zh8p36LajUPi0rsnQEanIjqN0govl31NgSWeaaXFv9ow1w==
X-Gm-Message-State: AOJu0YzMgzkgA/RpUYbbIVt+KTrywvlC4yQ6Xby0mitdUAVwo3NhSgmY
	SS1/DtRysAL0LkemhhiPGp2pYIVZZDN2sJln0QFL9yqLRXUnJ/DNdpf7l20oBZLKqUZ/sXhqc+g
	28TFM5DADmPCtQK1VCOhBJkV+B2CG9YkudcLwfQ==
X-Google-Smtp-Source: AGHT+IEtRx1HrvUdIl9lVl+UIb/PcANEEg5PYeHeY0mxB2XDs0jW8iRN77/OsKgLU6mZvK4++66o/Hv+e74Lr0U4QYU=
X-Received: by 2002:a81:a1cb:0:b0:60a:6b60:16f4 with SMTP id
 y194-20020a81a1cb000000b0060a6b6016f4mr210359ywg.8.1710374873784; Wed, 13 Mar
 2024 17:07:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240311-qcom-pd-mapper-v4-0-24679cca5c24@linaro.org>
 <20240311-qcom-pd-mapper-v4-1-24679cca5c24@linaro.org> <0fd377a8-281d-634f-014b-509fd8dada98@quicinc.com>
In-Reply-To: <0fd377a8-281d-634f-014b-509fd8dada98@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 14 Mar 2024 02:07:42 +0200
Message-ID: <CAA8EJppi4q-5ez4F4BvLMkU4UdUD_Rtu58cMj+Gq2udCaf9HzQ@mail.gmail.com>
Subject: Re: [PATCH v4 1/7] soc: qcom: pdr: protect locator_addr with the main mutex
To: Chris Lew <quic_clew@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Mathieu Poirier <mathieu.poirier@linaro.org>, linux-arm-msm@vger.kernel.org, 
	linux-remoteproc@vger.kernel.org, Johan Hovold <johan+linaro@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, 14 Mar 2024 at 01:35, Chris Lew <quic_clew@quicinc.com> wrote:
>
>
>
> On 3/11/2024 8:34 AM, Dmitry Baryshkov wrote:
> > @@ -133,11 +133,13 @@ static int pdr_register_listener(struct pdr_handle *pdr,
> >       req.enable = enable;
> >       strscpy(req.service_path, pds->service_path, sizeof(req.service_path));
> >
> > +     mutex_lock(&pdr->lock);
> >       ret = qmi_send_request(&pdr->notifier_hdl, &pds->addr,
> >                              &txn, SERVREG_REGISTER_LISTENER_REQ,
> >                              SERVREG_REGISTER_LISTENER_REQ_LEN,
> >                              servreg_register_listener_req_ei,
> >                              &req);
> > +     mutex_unlock(&pdr->lock);
> >       if (ret < 0) {
> >               qmi_txn_cancel(&txn);
> >               return ret;
> >
>
> Hi Dmitry,
>
> What is the reason for taking the pdr lock here? The addr struct passed
> into qmi_send_request is from the pdr_service. I think this is different
> from the pdr_handle we are protecting in the other parts of the patch.

Indeed, we should be taking pdr->list_lock.


-- 
With best wishes
Dmitry
