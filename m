Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91A9E157495
	for <linux-remoteproc@vger.kernel.org>; Tue, 18 Jun 2024 13:38:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718717928; cv=none; b=t8e09kaTnvNi3VzHvY3kU5L99vD+ztFQTmLs0ufAAzXk10Qr4PEFEeeLa/wQJsUK/CNbaJFmxaJuPBbng2VQRDQrquqkGEvPCJ+LwklG/VX8RHW7q3umR4JF37nM1K6A4sAwOuJ+srCct9ewhCq5+UEQ3okGpfXfPGrb87Vbxzo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718717928; c=relaxed/simple;
	bh=ZXkUgUNTrV2Fb75kL30lUgvJVNwEi/AAcntzHmWItcE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UGj6kJA3GJsCxw1fTDjEJwh5UAtQYE3gMeGIN4zvlRyKrbDlP3zTktRuL1ZDD0NUFMw9F8qQTJZW5dkLPhgdmFj/CxwJ5cUsPf0iCkY8RTcly56tS9KnWYGOAK3D7pBzZwyo8xB4D14VdJxOea1Lxdazd4y2FyjhQjhKYoi/CFk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=FIAamhF0; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FIAamhF0"
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-52cc14815c3so1288691e87.0
        for <linux-remoteproc@vger.kernel.org>; Tue, 18 Jun 2024 06:38:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718717925; x=1719322725; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1Ro2D1q0Iet+JsxqYv5jvanxXyaHmbiQwWFVhwfDlws=;
        b=FIAamhF0V9693BMdus4wQuGNWEmIOyfMJ/Odz0QiAdEzJwrz3GyHrD+4tyBCMwXRXV
         8VlgHOUl3b0QmmGwqIM0biPJ+s2WC/ibIWJbrURUsdm6d25h80/JxaTFEBX82b0WK6Fv
         ZvvA+Pl0YcIAXUz1kXpOW42PqxyTs3WKYUhoABQxe5w2SrmcbpqvlzoIkiFBpwL034N1
         b427WaGr9dfjcoEwyr0hskfzytmjCcEZ96MIYiHZpsYhzYqOCy8dTrKCp6DKFoAhwEly
         SpHmOcMDX9CiWGiC8iY9TEx3QN2O7vRfLT5ozhMLetR5U+y3kWYwr54d85n9Bt315HZT
         nW6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718717925; x=1719322725;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1Ro2D1q0Iet+JsxqYv5jvanxXyaHmbiQwWFVhwfDlws=;
        b=cfZP/Wx0R7uxzQNFJwmp3HZM/6k/yRuF2f636GHX+4H0iZfVPduRya4ArdR3ON0M3y
         MlYrkXL9Q6pR0Gl5XY+V3zKyhWE/I5nxKUeQHS5DC9509e3SkygCPpNGO8szyjY3pHoZ
         4j+Cd9gwXdd8vPVfS8CK8miA/N1syQmrIM7o0++ZiUXifPd3a88BTwLoy5rfvPii2Q3a
         Ewm5qBsH+cTiypyO7yk1llZZZScwWWrsoRCgzhpvqMPwVuVt6LVMowesnPl15NcJINw6
         ca1nlMzQhGUlcoYQglOtLJQywvusDI4HQcIUqgz06IJea3roYeXekoFkQ3/9d1sb784A
         Rz6Q==
X-Forwarded-Encrypted: i=1; AJvYcCVUH/N6XhnZvjqL827d1mx9fJ+qdvagSCnVJnB4LixfrayijO3xWJjvTRLNjuQeeAWrm5Gg7BQPGIhFksRqWtoDJkhrPF0ARhK8BbwRn4ge1g==
X-Gm-Message-State: AOJu0YwdihBKmmsCHkUEQYmIkkQ2e4qwV9Aq+F9+K9XnNpHI54CG7/uf
	EIOHZEuC1DtwXjOnXyaCO4LWkazrAVjzWBn/4eImoq+FB2LdRoi8/gzVuQxSJXKHcJGu+rWhb3+
	Eg6o=
X-Google-Smtp-Source: AGHT+IF87ZxV1Eqx7KyoE3WteMFt56EssikJPs0A4NGrSgdY3b3dUyfEiaDVHF88FgnOxhFSt2XIWA==
X-Received: by 2002:ac2:57c3:0:b0:52b:c292:f7c with SMTP id 2adb3069b0e04-52ca6e9886emr7565855e87.62.1718717924535;
        Tue, 18 Jun 2024 06:38:44 -0700 (PDT)
Received: from ?IPV6:2a00:f41:9028:9df3:4fb7:492b:2c94:7283? ([2a00:f41:9028:9df3:4fb7:492b:2c94:7283])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52cbc12bc4fsm627269e87.292.2024.06.18.06.38.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Jun 2024 06:38:44 -0700 (PDT)
Message-ID: <e5b7a888-8ca3-463a-a2de-cf719e58d7a0@linaro.org>
Date: Tue, 18 Jun 2024 15:38:41 +0200
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/5] arm64: dts: qcom: sdx75: update reserved memory
 regions for mpss
To: Naina Mehta <quic_nainmeht@quicinc.com>, andersson@kernel.org,
 mathieu.poirier@linaro.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, manivannan.sadhasivam@linaro.org
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20240618131342.103995-1-quic_nainmeht@quicinc.com>
 <20240618131342.103995-4-quic_nainmeht@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20240618131342.103995-4-quic_nainmeht@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 6/18/24 15:13, Naina Mehta wrote:
> Rename qdss@88800000 memory region as qlink_logging memory region
> and add qdss_mem memory region at address of 0x88500000.
> Split mpss_dsmharq_mem region into 2 separate regions and
> reduce the size of mpssadsp_mem region.
> 
> Signed-off-by: Naina Mehta <quic_nainmeht@quicinc.com>
> ---

Alright, we're getting somewhere. The commit message should however motivate
why such changes are necessary. For all we know, the splitting in two is
currently done for no reason, as qdss_mem and qlink_logging_mem are contiguous
- does the firmware have some expectations about them being separate?

Konrad
