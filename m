Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com [209.85.219.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82BC153A1
	for <linux-remoteproc@vger.kernel.org>; Tue, 12 Mar 2024 01:03:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710205411; cv=none; b=YJK2a/mokmNHHXzjwvvQAovR3eBtfDizPdSwX8v0tMVxtdbv0dYAIxvK8zde9nn71ICiDsQI+EdURQcd9HJplv3fMKBxZy+XIx7AMd+Mcy+QkitBavi1BALkncQaH79ietP3Aqpv9iG8pue/gpyFMruwkm3VvY7IHBwdxPB8CUs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710205411; c=relaxed/simple;
	bh=mllAJVdUnscH65M6A/IFWXfzMztwOkscsI91LkruZpk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=B4xUkrbm7a3NwY0Y7NOERPBkS1UxUUJdKZ4eb8ina75m2mDr72cUr2mwoVHD1xzlMGp4zJKJo/5kGLcuvN0Hl9c9O6AMSxDb+OiIBsyLGbxJ6ynbn9++ZBz7DT4szG7kK1NiSmO/ZDKzZ5BtiP9EYJLuH1awdzhVyWW3tSKe80s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=c2W6YfP2; arc=none smtp.client-ip=209.85.219.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="c2W6YfP2"
Received: by mail-yb1-f169.google.com with SMTP id 3f1490d57ef6-dc6d9a8815fso4905661276.3
        for <linux-remoteproc@vger.kernel.org>; Mon, 11 Mar 2024 18:03:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1710205407; x=1710810207; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ws7LKeep8xs071G+zIEyu5NMNq4g7+CkOu+MrT6LYWg=;
        b=c2W6YfP26OTHUrF8R42hXL9bKkkeXj2BlY94TM4k7z3orfBIqcwV4+7wT5LH+zs0hE
         USFtmTAk0DzOKDaF1BycrkfHCrtFnJw3MNQFBKm3MIySfbOr6eHaAtF5gyeR2z7u0gO9
         bDYpsC2n8m3XESYOtZPzGekmbzOXpLL19prw771XoIeT7fWgmj84xmo2bPgntcI/6rLZ
         8Nwh3oO+cP+rwLdcfQJycOZO4GqrORnrkpBLrLon4OxvCKYMQL1Lb77NixC4NJQRTUz2
         akQOppuQNIBUIqYSnp4r6OHxwoS8DEHurbrS52m3D50IOMDExF3+8FXKDIVl1Z0t+wz7
         vpZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710205407; x=1710810207;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ws7LKeep8xs071G+zIEyu5NMNq4g7+CkOu+MrT6LYWg=;
        b=NPJmzftNmXyjSDD3kWVFnQmStcvlX1igsPidQ0uqPUs7kcoplDZXacCskPazzw4rQv
         hSJS2whzwB4QS47WfeKZtkHpFvP6NUnOP7ajY3lyaP3hUOyvV79JTfByNXvUZyOG5MPY
         tTPcD59Ph3s+hdMXnKBlp53clzNLEDBWRIU2yvjJOsQRnY23E8Ye0eWywUSSkAZcOuMn
         SbmR0l3ZPMI8klu9VJyVz2F+6gWwW3cuFfSa4eWe1zaChtoPnryq4enKRD2mgHHqRh6Q
         ZeXTWpwc5wJs3hGsABL7HgkUDdMRIPslk4uBdT6bFYyw1C6Qvj0+a8sRNEAneHqOGoRh
         S/RA==
X-Forwarded-Encrypted: i=1; AJvYcCWUkp+/Yz7bfaasbT5FO1eY58cwUL2soVlcV+Cgr0DK4QO8EIYBGK9HyIRXSKmXk34PseBXbjkiXEOsYZcBfku+3QEg6yprUDtfw+Jrl4mV5w==
X-Gm-Message-State: AOJu0YwCz+hvCpEt49jausBO+uekDA9mcAgfbzLgbfOtrfp0cdSAJ8UV
	DLkDe9te3l5m44L+0RMfiav8sPvx5o4TX91A+PugU1p1wSgVeG862fxlJn1ZxwsdXcqXgSCA5I0
	yP69QOrduKPKqzU+EzOcnoQKkqelRNuuBiThKcQ==
X-Google-Smtp-Source: AGHT+IGnbKO6H0C20S0kebFSx0qWkvqE68K5N495YSoxog7GKNvUgRkw3+0e9zY2XmsTV7V2X6VEfkR4TsptJ1mwCpc=
X-Received: by 2002:a25:ad10:0:b0:dcc:9e88:b15 with SMTP id
 y16-20020a25ad10000000b00dcc9e880b15mr346522ybi.41.1710205407500; Mon, 11 Mar
 2024 18:03:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240311-qcom-pd-mapper-v4-0-24679cca5c24@linaro.org>
 <20240311-qcom-pd-mapper-v4-2-24679cca5c24@linaro.org> <05b640a9-c5e4-4140-95dd-9b35269d85cd@linaro.org>
In-Reply-To: <05b640a9-c5e4-4140-95dd-9b35269d85cd@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 12 Mar 2024 03:03:17 +0200
Message-ID: <CAA8EJprNMGRXXY_sehehfSyZrHc3NN=C5fG6o5wYDpDzr4KQ=g@mail.gmail.com>
Subject: Re: [PATCH v4 2/7] soc: qcom: qmi: add a way to remove running service
To: Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Mathieu Poirier <mathieu.poirier@linaro.org>, 
	linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, 
	Johan Hovold <johan+linaro@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, 12 Mar 2024 at 02:53, Konrad Dybcio <konrad.dybcio@linaro.org> wrote:
>
>
>
> On 3/11/24 16:34, Dmitry Baryshkov wrote:
> > Add qmi_del_server(), a pair to qmi_add_server(), a way to remove
> > running server from the QMI socket. This is e.g. necessary for
> > pd-mapper, which needs to readd a server each time the DSP is started or
> > stopped.
> >
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >   drivers/soc/qcom/qmi_interface.c | 67 ++++++++++++++++++++++++++++++++++++++++
> >   include/linux/soc/qcom/qmi.h     |  2 ++
> >   2 files changed, 69 insertions(+)
> >
> > diff --git a/drivers/soc/qcom/qmi_interface.c b/drivers/soc/qcom/qmi_interface.c
> > index bb98b06e87f8..18ff2015c682 100644
> > --- a/drivers/soc/qcom/qmi_interface.c
> > +++ b/drivers/soc/qcom/qmi_interface.c
> > @@ -289,6 +289,73 @@ int qmi_add_server(struct qmi_handle *qmi, unsigned int service,
> >   }
> >   EXPORT_SYMBOL_GPL(qmi_add_server);
> >
> > +static void qmi_send_del_server(struct qmi_handle *qmi, struct qmi_service *svc)
> > +{
> > +     struct qrtr_ctrl_pkt pkt;
> > +     struct sockaddr_qrtr sq;
> > +     struct msghdr msg = { };
> > +     struct kvec iv = { &pkt, sizeof(pkt) };
> > +     int ret;
> > +
> > +     memset(&pkt, 0, sizeof(pkt));
>
> 0-init instead?
>
> > +     pkt.cmd = cpu_to_le32(QRTR_TYPE_DEL_SERVER);
> > +     pkt.server.service = cpu_to_le32(svc->service);
> > +     pkt.server.instance = cpu_to_le32(svc->version | svc->instance << 8);
> > +     pkt.server.node = cpu_to_le32(qmi->sq.sq_node);
> > +     pkt.server.port = cpu_to_le32(qmi->sq.sq_port);
>
> Or perhaps C99-init?

This follows 1:1 qcom_send_add_server(). I don't think we should use
new style just for this function.

>
> Konrad



-- 
With best wishes
Dmitry
