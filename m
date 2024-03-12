Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1CF579C3
	for <linux-remoteproc@vger.kernel.org>; Tue, 12 Mar 2024 00:53:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710204823; cv=none; b=ZxA5ct723V+X/8teMxmOm5uHbd8RDnTCnmih94QZqomAvtoWPKIMu7Xpq6SEWxxHNXF9sEo3vOYOLgtuhsgj8e7iFjHIRmMH9IXpOmhA1UTxXRFtDQ81ly0hqb2DzJWSN8YKl5ok5WoTPjwAuL3spBkKdJuY4SpnQxZm3zHKZPk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710204823; c=relaxed/simple;
	bh=HRl+KVp0V0W00QnN93JM9gLDCTRYitW5LllqOJBHdp8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IDD1d/CUFHszfZ3X3r5JqXI5a5tcKZMqBKcqPaAFdw2RJeG33eaXlPBQNvd/CAb8SUZKYLuL/4M9dh6THeHoY2dQLpj1TSbDpvciMWwoFb24DIcga3Lpx8RjxmtYzLW8kP/A3iBb/y9U7px8PFTZxOf871nH0PcU70RMpyVAiwI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=dR/g//lj; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dR/g//lj"
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5101cd91017so8080743e87.2
        for <linux-remoteproc@vger.kernel.org>; Mon, 11 Mar 2024 17:53:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1710204820; x=1710809620; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ljQX1YTQSh3VKU8MEyaNfB4gAsQnxEN54+xmiuLiaNk=;
        b=dR/g//ljMq8GOHIBPA6rIykSMQe/6kj/XW47UTVqqkeKlVLv9wVDYMHaE7mp02PkfX
         YxnOxoloMEtoT1Jai5/pG4XbCwaHigyczj71SepvWrgU/RgbEusNkQGmd7wvhUjygW6o
         LkpNDx6VCf0ei2ZIFdNb+J46+rlS4YscJt3HpqnZRlHdhKEksbqFhkHCUOSdiD1AmaS4
         0SAYYD3rJcjK3J4S1rIsyEcwKWn45HwKv5hbhn+KnENtQl1nWYptFaJQ2ZzSp4X9AbwD
         Q0X0mZG0b3h2zlfogKnJGGgTWHk9Js8l7rPe08y/1J3KVlZVZ/+/SQeHpodhz1s77//z
         m9xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710204820; x=1710809620;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ljQX1YTQSh3VKU8MEyaNfB4gAsQnxEN54+xmiuLiaNk=;
        b=WzWauJETlxn9rCEHaWveD5j85B8WDfXHB4SXQZjzWw+Hn7EAI/VCbSGwf7rUzNrbyW
         p813dwEOha8cUKLefWVOJ2NzZP+yboEHQN4XD3gSOJhFSQg8C1ZM38a7H0GAhxEqcwVY
         Kie86IO9PQ/UNKg1LZdI44MFUfY+DEN/Pe8DwhSG71uLDZjr3GQRv177iZDwoZcjrJbF
         5upz65FviLqkFJ1/hKDyM+LKxRsQ76ccFf0UF+nZYgsyJC17FlbjyZ4wJorpcSimep3c
         FzOlXLdvHA630TqvWF6KI4NIGMVivqQIaCctZOMS5fE9jhRdARDvADQbjdXqocCjoz/e
         geLQ==
X-Forwarded-Encrypted: i=1; AJvYcCUxpfTsoaXf8RiSILW1PKEvHsG3X+u5EioEC1cAaDSIzgT3AXM6s3oWAshCy0llc/xXtD/7DqWzVRfZSr2Fuv7lNA5DADScAwwb50tmPMx/1A==
X-Gm-Message-State: AOJu0Yx7qGIob9L8xaPUzoNKTn6yZKHoJ3uxfWMjxU4QPjjiIvP4TTc0
	f4cFtEGMgNuRIjRsvf6A4cKO/0ziz0lu4/4a2VRMpJ+Ds8YpIMsWVW19OzGGbhk=
X-Google-Smtp-Source: AGHT+IFM2aYEoFHW0oVsIIOzTHbHVIFlb/dMl6fv0ZI94Akk4cg4Qxa3bhfGPq/jmnTcvXUOmS/3Hg==
X-Received: by 2002:a19:ca19:0:b0:513:5a3c:e8cc with SMTP id a25-20020a19ca19000000b005135a3ce8ccmr4439914lfg.19.1710204820104;
        Mon, 11 Mar 2024 17:53:40 -0700 (PDT)
Received: from [172.30.205.61] (UNUSED.212-182-62-129.lubman.net.pl. [212.182.62.129])
        by smtp.gmail.com with ESMTPSA id i26-20020a198c5a000000b00513177e424csm1363399lfj.168.2024.03.11.17.53.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Mar 2024 17:53:39 -0700 (PDT)
Message-ID: <05b640a9-c5e4-4140-95dd-9b35269d85cd@linaro.org>
Date: Tue, 12 Mar 2024 01:53:37 +0100
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/7] soc: qcom: qmi: add a way to remove running
 service
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
 Johan Hovold <johan+linaro@kernel.org>
References: <20240311-qcom-pd-mapper-v4-0-24679cca5c24@linaro.org>
 <20240311-qcom-pd-mapper-v4-2-24679cca5c24@linaro.org>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20240311-qcom-pd-mapper-v4-2-24679cca5c24@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 3/11/24 16:34, Dmitry Baryshkov wrote:
> Add qmi_del_server(), a pair to qmi_add_server(), a way to remove
> running server from the QMI socket. This is e.g. necessary for
> pd-mapper, which needs to readd a server each time the DSP is started or
> stopped.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   drivers/soc/qcom/qmi_interface.c | 67 ++++++++++++++++++++++++++++++++++++++++
>   include/linux/soc/qcom/qmi.h     |  2 ++
>   2 files changed, 69 insertions(+)
> 
> diff --git a/drivers/soc/qcom/qmi_interface.c b/drivers/soc/qcom/qmi_interface.c
> index bb98b06e87f8..18ff2015c682 100644
> --- a/drivers/soc/qcom/qmi_interface.c
> +++ b/drivers/soc/qcom/qmi_interface.c
> @@ -289,6 +289,73 @@ int qmi_add_server(struct qmi_handle *qmi, unsigned int service,
>   }
>   EXPORT_SYMBOL_GPL(qmi_add_server);
>   
> +static void qmi_send_del_server(struct qmi_handle *qmi, struct qmi_service *svc)
> +{
> +	struct qrtr_ctrl_pkt pkt;
> +	struct sockaddr_qrtr sq;
> +	struct msghdr msg = { };
> +	struct kvec iv = { &pkt, sizeof(pkt) };
> +	int ret;
> +
> +	memset(&pkt, 0, sizeof(pkt));

0-init instead?

> +	pkt.cmd = cpu_to_le32(QRTR_TYPE_DEL_SERVER);
> +	pkt.server.service = cpu_to_le32(svc->service);
> +	pkt.server.instance = cpu_to_le32(svc->version | svc->instance << 8);
> +	pkt.server.node = cpu_to_le32(qmi->sq.sq_node);
> +	pkt.server.port = cpu_to_le32(qmi->sq.sq_port);

Or perhaps C99-init?

Konrad
