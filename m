Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C833879DDC
	for <linux-remoteproc@vger.kernel.org>; Mon,  4 Mar 2024 20:06:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709582807; cv=none; b=HfC729/XNLG2SQMc3Clhm5W6KeLnxusbG75AY+Uo6P1JpNv9Jqxsm6M1p3/Zddp5iaqcWEcm9dU253enpr76JHU8vIt/O9EGx1wx1AJ5nGPvEbUrwWMxNH3UjxKzQKs/scil+Rbu/ZY8HyrCtkDtpBokaoszx1DtqHmqDPN+/d8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709582807; c=relaxed/simple;
	bh=wGNJtzEk6+yIebGIJQBLGklYj2sOsFFKmCMRYRIudVA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UAwtD7YtxcAEPqMRkqzimJzdrqgP+VUC/FUJ5Lu61ypmeehHxsUdllhXI7IdlnupbfCuxsTF7/o70ZhsFEuZQj5xvMUve6+iQEFlI+pEFqDEFK76m3uTn4jw0MhxGwpuxuAusQYOHHGaOPhTBKBRNjb0XyK3Ma4AwIgebbJm2ZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ry8tQKp8; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ry8tQKp8"
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-512b700c8ebso5600999e87.0
        for <linux-remoteproc@vger.kernel.org>; Mon, 04 Mar 2024 12:06:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709582804; x=1710187604; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5brs5moszmS5MRGsApR5nApcQx+YA/tMCWRWoCVwqcc=;
        b=ry8tQKp80Vli0o31lxc/YEOWrY2bNvnB9hcWzISnzg1xbv4XIpsR44g4Z2gSnjU614
         1rjL1pMNrV7BPdpmttOcfwJPGRAXnUMOUWdpCvaqwKMDBeds2guk+bIbvXhx90iKsfOP
         Hpi5sYYirUHyZq8gmze0tpKetbqzBQpT0+qiO0ALPqBmU1EagQqXOQST3HDgSnQE3Q5v
         kvSi9RwQRi98w8z3qbkv0rLCr5+nfcf1kTw4GPPikGtQcYQvoXPTPxRDLR4Lg5f6b00e
         ur2G488KseKKg3HPdCmaSCEX16YRjI1eZqCQqzolCE4lceDF92JIypczYKyHY81mTYH8
         J8Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709582804; x=1710187604;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5brs5moszmS5MRGsApR5nApcQx+YA/tMCWRWoCVwqcc=;
        b=ULcpoLXETWuKd+k40Od0F33MQfLkk4AH93P7zmydtH9XuSs8QG/KNBdRgoV0ibzx9q
         9X6xj/fVidQJx93ByzNR80eITl2pAmzJ3/HQh1QrQR1nLlpxsS0N5W3qmUf3KT/cD8Y4
         uZaxbWOH5SnKRDe5dLJeymTMi+9RjlwQ+toG2VWSiWUqn4CKUadpniM7bTVlxdgxj2OO
         ad7nKvQsF8LufIVvDeD0bCrrPOji3IO7a10MjhiZ2lpg3Ec+9Nt0X5ngo1wGzElbUfuN
         tKDgZsDWKGE8Tq5JKlxDEcaoVA6g91qYaPdPftVzP5R0iQQZHL9FBvYqPL78OOwaFAFK
         FMMA==
X-Forwarded-Encrypted: i=1; AJvYcCVN1tLYEZFO6WbrEE2TT6syeau6jb/U+zLsvmhiauy3RtQokkeG5otpEskwjCSOS0SPgv0UrNOQ3b2gC5jO2Yj2m7QqbIiu4XoeDIMhnSfjCw==
X-Gm-Message-State: AOJu0YzBe8x4eE5+xIgU+JsGmowq1LGvuZv92qN2kuOUVn1EaX9SVbrZ
	IJsXaKr2bw3+AVzidPDcQALSz8qgZumfq7f/465V5/Ms5mVgmTPXTxiaGDgxipI=
X-Google-Smtp-Source: AGHT+IE1CQh064ULI2MLniYYCxo/NAhJh7V4CAn+RqIhN/0Um+i6kHY7g3CT6TJIVqoDaGWSm2duGQ==
X-Received: by 2002:ac2:4a89:0:b0:513:25a3:843b with SMTP id l9-20020ac24a89000000b0051325a3843bmr5697649lfp.25.1709582803959;
        Mon, 04 Mar 2024 12:06:43 -0800 (PST)
Received: from [172.30.204.149] (UNUSED.212-182-62-129.lubman.net.pl. [212.182.62.129])
        by smtp.gmail.com with ESMTPSA id h26-20020ac24dba000000b0051317eb0bcdsm1868276lfe.245.2024.03.04.12.06.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 Mar 2024 12:06:43 -0800 (PST)
Message-ID: <60f44832-745e-4a6b-b608-b61a8f3cf87a@linaro.org>
Date: Mon, 4 Mar 2024 21:06:40 +0100
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC v3 4/7] remoteproc: qcom: pas: correct data
 indentation
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
 Johan Hovold <johan+linaro@kernel.org>
References: <20240304-qcom-pd-mapper-v3-0-6858fa1ac1c8@linaro.org>
 <20240304-qcom-pd-mapper-v3-4-6858fa1ac1c8@linaro.org>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20240304-qcom-pd-mapper-v3-4-6858fa1ac1c8@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 3/4/24 18:03, Dmitry Baryshkov wrote:
> Correct indentation of several struct adsp_data instances to always use
> a single TAB character instead of two.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
