Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C59EE1591E3
	for <linux-remoteproc@vger.kernel.org>; Wed, 29 May 2024 14:31:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716993066; cv=none; b=L0yetLDTn/GqRgYwpCbL0yx+oe0+Rd9WRqhEbdm8Lo5WX6DIQrkQyAgheGR3/b9xeWugEe3C1sbPf0ZbyyiB0ltVftNYixPqh7btcM+ql8r/okC9y3mxuOFdxtu1EaMeJelIme7r7p8zX1l9GqoH5xhffk7BFKHZO/qI+8GUllo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716993066; c=relaxed/simple;
	bh=s7MqhIA2k1o92AFgjBwBqJR3rblBbBM3GWJU414VvXo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Xgfm5Q2kzd1oFoX9mH4cXOfOrC/KbPYFMN5auifkfqF5JL8Wjpb/a38FwHaAtR781cBR/WEZhZLqKqOiKleY6Uzjb5W6msxGlAeHHUnwSWSKkx8OIsMXd0gcZsXdHg9Y8lPFB7MjlFZ83OdPbmquGv4XiQyBk413fN4ipTBwX0E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=qz8j8WHN; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="qz8j8WHN"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-a632ba6c9dbso275109166b.2
        for <linux-remoteproc@vger.kernel.org>; Wed, 29 May 2024 07:31:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1716993063; x=1717597863; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=b5kjUD/BaTzf0mViMsh1tidjf2ba6yZaAKRk9sMmZ0s=;
        b=qz8j8WHNKPyZYXDBwRMliXVIUiVSb2FrF67OBkcCT6CbscAeu95X96UCCyMhGJ9VOG
         xkRfqq0Akh0YvcmVelzcZvs9nd9wySZSbi+TEwpStZu6BwNVKXiR+L/NS7JBPjdRSQVQ
         WJ6ZPhfEIfa/Xv71K2Rbf6Dh/R0PEQQYwZjbmDTOOL2XWkytCEv9xEOi6TBZm/J589RE
         knMRHZSzkU/VbgAb/j+q1eQKsBLoaO9+s3kiIkV38rrQAvBf3ipIZVoN6erzDYouyV6R
         c2T1BQBv+kZKnaT0JQEbiI2cYQ9EOCxlJYRwLKasJcTujQvdnQ6b1wV8B1cIWKdfiCWi
         IyrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716993063; x=1717597863;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b5kjUD/BaTzf0mViMsh1tidjf2ba6yZaAKRk9sMmZ0s=;
        b=YbieU+mVJvcofeH3MYQtfY/Tl265rMTp7ChgBtG2VTDaaThpTtxExeT1BUbZTZMAI7
         JvjBGD+lAIi8aFb0HyAkE3U48TSs/RpwE+30/YWzExE2ZLU35WXd2eZaQUIAVa6pSmHu
         Jz3E3ou/SG9uc/ySSVsj+3qwVlytE15Kr5Z7hv+ofqyOjaao6aa63LxJsNybV2nJEhRy
         /N5QYE10eMAxEL9VgXu2LfggfdetUxUW42Ro2QUmslKzJpnAtu9+lZGf5vHSmtF7Yv+L
         S26X5Aa6ir3o9BtGoNBE2bP4v8dCtiAMlASYPC9OlYnOx5cetXdobdm6BDTRGzs9Jlin
         fkdA==
X-Forwarded-Encrypted: i=1; AJvYcCU8RREmIc0k266ut0FGgZMFTaayLm8xCAfhyrWuo4Fs2+wiXInCP6QV0WhBahp+sVdftvPAQlBhdCVzufRr9L2Wf/E3WnP9e6Ox+MUXsC7cuQ==
X-Gm-Message-State: AOJu0YyF3qONTLMxnxxbQ8vipsJzBlauSbN1yhMNQaWppTbPJw/8kwS3
	w2O/TK8hregw4xu2DlQL6shuBmqXbvXmQhXsDadGc0qbj1K0pMK/Puy9ZNFpMJI=
X-Google-Smtp-Source: AGHT+IGNekbf4DX5xO5+bF+yGQIK2Xuej3xlH9d3c2+YnRnIm165xIkTt76MLqHe7R9ZaduHt3kQzw==
X-Received: by 2002:a17:906:a08a:b0:a5c:de6f:87e7 with SMTP id a640c23a62f3a-a6264f0ecd7mr1116596066b.61.1716993063122;
        Wed, 29 May 2024 07:31:03 -0700 (PDT)
Received: from [192.168.128.35] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a626cda48e6sm718178466b.203.2024.05.29.07.31.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 May 2024 07:31:02 -0700 (PDT)
Message-ID: <1f4b0f72-d0d0-4e09-a8a1-e63cf67db445@linaro.org>
Date: Wed, 29 May 2024 16:31:01 +0200
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/5] dt-bindings: remoteproc: qcom,sm8550-pas: Document
 the SA8775p ADSP, CDSP and GPDSP
To: Bartosz Golaszewski <brgl@bgdev.pl>, neil.armstrong@linaro.org
Cc: Bjorn Andersson <andersson@kernel.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 Jassi Brar <jassisinghbrar@gmail.com>,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
 linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Tengfei Fan <quic_tengfan@quicinc.com>,
 Srini Kandagatla <srinivas.kandagatla@linaro.org>,
 Alex Elder <elder@kernel.org>
References: <20240522-topic-lemans-iot-remoteproc-v1-0-af9fab7b27f0@linaro.org>
 <20240522-topic-lemans-iot-remoteproc-v1-1-af9fab7b27f0@linaro.org>
 <e89c3270-e51f-4d5b-87db-09ff8f0961e6@linaro.org>
 <CAMRc=MczvfcXnEae__LJh47T=vCTbCz9EHOrNP+QmpTDvdarZw@mail.gmail.com>
 <42ba8472-9d63-4125-b538-39d8090203b4@linaro.org>
 <CAMRc=Mcd4qoF-BtHdpHSy5DEDDKYV7RK2hCgegf7_63eRoahTQ@mail.gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Autocrypt: addr=konrad.dybcio@linaro.org; keydata=
 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
 izWDgYvmBE8=
In-Reply-To: <CAMRc=Mcd4qoF-BtHdpHSy5DEDDKYV7RK2hCgegf7_63eRoahTQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 22.05.2024 3:08 PM, Bartosz Golaszewski wrote:
> On Wed, May 22, 2024 at 3:06 PM <neil.armstrong@linaro.org> wrote:
>>
>> On 22/05/2024 15:04, Bartosz Golaszewski wrote:
>>> On Wed, May 22, 2024 at 2:42 PM <neil.armstrong@linaro.org> wrote:
>>>>
>>>> On 22/05/2024 14:08, Bartosz Golaszewski wrote:
>>>>> From: Tengfei Fan <quic_tengfan@quicinc.com>
>>>>>
>>>>> Document the compatibles for the components used to boot the ADSP, CDSP0,
>>>>> CDSP1, GPDSP0 and GPDSP1 on the SA8775p SoC.
>>>>>
>>>>> Signed-off-by: Tengfei Fan <quic_tengfan@quicinc.com>
>>>>> Co-developed-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>>>>> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>>>>> ---
>>>>>    .../bindings/remoteproc/qcom,sm8550-pas.yaml       | 76 +++++++++++++++++++++-
>>>>>    1 file changed, 75 insertions(+), 1 deletion(-)
>>>>>
>>>>> diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
>>>>> index 73fda7565cd1..9d3a862c39e1 100644
>>>>> --- a/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
>>>>> +++ b/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
>>>>> @@ -16,6 +16,11 @@ description:
>>>>>    properties:
>>>>>      compatible:
>>>>>        enum:
>>>>> +      - qcom,sa8775p-adsp-pas
>>>>> +      - qcom,sa8775p-cdsp0-pas
>>>>> +      - qcom,sa8775p-cdsp1-pas
>>>>> +      - qcom,sa8775p-gpdsp0-pas
>>>>> +      - qcom,sa8775p-gpdsp1-pas
>>>>>          - qcom,sm8550-adsp-pas
>>>>>          - qcom,sm8550-cdsp-pas
>>>>>          - qcom,sm8550-mpss-pas
>>>>> @@ -44,12 +49,13 @@ properties:
>>>>>
>>>>>      firmware-name:
>>>>>        $ref: /schemas/types.yaml#/definitions/string-array
>>>>> +    minItems: 1
>>>>
>>>> This will allow a single firmware name for all compatible,
>>>> which is wrong
>>>>
>>>
>>> So increasing the limit from the default under allOf doesn't seem to
>>> work, should I instead keep this and make the lower limit stricter for
>>> all other models?
>>
>> Yes add minItems in all the allOf:if: and add the missing allOf:if: for
>> the new compatibles to set the minItems, same for memory-region.
>>
>> Or you may simply spin off a new yaml, this one is getting quite large.
>>
> 
> Yeah, maybe that's a better idea.

+ if you get rid of the 0/1 in "nsp0/nsp1" you save a couple more lines

Konrad
