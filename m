Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 821703EB81D
	for <linux-remoteproc@vger.kernel.org>; Fri, 31 Jul 2026 11:20:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785496856; cv=none; b=XNHqiyrujwJfAfG/ecPtAnIaup2jZtZktm8Y0QGD/85TSJ5tH3XViFgwmbcwvxpIED7GhtTtsSY4Vi1coBCMZH4PPwHyir5/YltE5spGjddNdqLD2Cep1O3NXm0nkzM/tf2N4jU2fFVMa2FXCKcad1cAfsigKqzAzy1kSfszM/g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785496856; c=relaxed/simple;
	bh=bhq3MzeqOsauBzIWfBC+LweuxxY/XXQ4w63ZT64jvPM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Bs+G+xY3nOLN+Js+6cFgoZEpW3cxQBYL4Tt34ildIcuB5h9wzLQHZ6WhPoiqdsdh+/0l+BwN948Jzd0hJGmVLFI9m54DxDNK/REsObBCMWa14pEIIvYloSvI7CvmRx7RTzoChCJisc7hI7RkE/nrbJk+v9QHziAs7Vw/pvin1EM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=dmVncrkE; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dmVncrkE"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-c15cf78d1a2so102961766b.1
        for <linux-remoteproc@vger.kernel.org>; Fri, 31 Jul 2026 04:20:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1785496853; x=1786101653; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=bzkNS7AH3AQpIYPHQeQ9hpg4r1cVjOJtrFQ4q2xajzU=;
        b=dmVncrkEQMeZ3LCEtrYL7CKtvI9z3zNHGLiZrU4uVjApYP+2LAbk6nesi/bE8VH9Ku
         Pdz+s/ZWQKVRlwGNRKxLlmHqvoId39fwxRp+ju/k9w0tkNvwwKw/7k2dsvnFByGknyb5
         6ZSHtJkGMFJsfKI2lJLXqGC/ewN7t/2+vW1qB3/JLlnXq2MUQQZLbipQGZNVs1HmSTre
         s6GdXVTtawgh+wv3dZMEad0Q5zl5IYOmgRGOFFKo6XHOIeOApbMioQ8axdw3b+VDGGSG
         nxVqUhpg+LqSTbjjrNFu3XUItIdvf0jz5CNbQ/h6l+UoGwQTlAZFnr9umE3F/oaF+Yhs
         sseA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785496853; x=1786101653;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=bzkNS7AH3AQpIYPHQeQ9hpg4r1cVjOJtrFQ4q2xajzU=;
        b=gaWa/vhq2Zc0z6iTIkxTtI8X9KGXNwW3bxMB3ORhDV32TJ+OuTPbqjTK/GC9TRirMl
         Q0KP28RRe8FXqGxPEp0xPs/Jn7seY7YoBXW5WcZSNkrIzvLu2fCY1o6pXliR0Z92V388
         NNC5B6zWe/pNzqjjqmx7vWWXRqAwDIDUH9ogelhquXKi0zW+tiqf3aSGCs4fXJtYSXVI
         8rfWvD0WtPbmaGiikZa0x7W8IbSilbiym7UEubo1P7IdubDWZYIUzLuHtA8IQHT12H3t
         p/qIDk5MuvLRK9L6ABFevs91D805DsAL9bacf7xvGhmAjXQoAh72axmm5R50IVZhsDI/
         wGGw==
X-Forwarded-Encrypted: i=1; AHgh+Rqrjq651rmPTwD7i4fSS4497tidvEBgBX/dqUlopo0ZVX5gekro9kyhfoSzLkv+0wsKZAZqTthiZrdcOgl7u5AO@vger.kernel.org
X-Gm-Message-State: AOJu0YyVBfUxAPF3PoewA/Wuj6w4ND03VJUo8an0BVfSzDYRSanJfhi5
	SwvAtFz3vkfm0kIMHxLgWzQQYF7KdtFToZNnatB2MXmp28h2zoiBJHSJkOWL2GUxtOs=
X-Gm-Gg: AR+sD10v1bGpmzH0U2aGuVApGj+6EnDbvbRTrY6qDyxs0rnoZnIt01VwqHoFaaOeqL9
	HTiA9p/GWf/kTPlSmRpGvliap4CEdAjH6ibg4pD0lSNq+11hb/qS0p81xinEZSup7kDW9JWEb4a
	bBxaPsS0m5mXcJlJwaFLrFoESPkOunfsFwXaRC6FuqCOtg5ToswtvJORwq4Ky685Vnj5p/HT5Wg
	1BTVHmu20HsedyK/gPZ76ffBzjYlbZiGoUzXfq/VmPg4gIWjItokaeZnnCrqLHcMmv1TIDmrdbR
	sg2ijYnbtXbu24g9L6t2oT0TDopwKv61SzTWq9KPWhOAnJC5sGyekYFM2papszdrdUlcIkyzFXi
	bVHLWCSx/f3g+BQc+LRBGa+0MXkvCij7SebaG5Y74C/Y/c1fY0GRduB4stT4aMLFRliTiycyHvC
	7TxtiRkfsApnfHXcHSW40PrGzJiFuAEiapUbf42WflDq/QGV8Ymu61EFsuojDa0XZZFQrWcdHm
X-Received: by 2002:a17:907:1ca4:b0:c12:6dbf:4a80 with SMTP id a640c23a62f3a-c1fd295ec35mr86137366b.63.1785496852551;
        Fri, 31 Jul 2026 04:20:52 -0700 (PDT)
Received: from linaro.org ([2a02:2454:ff24:7210:4eea:ae3f:f2e0:1952])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1fd3cc331fsm128489966b.28.2026.07.31.04.20.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jul 2026 04:20:52 -0700 (PDT)
Date: Fri, 31 Jul 2026 13:20:48 +0200
From: Stephan Gerhold <stephan.gerhold@linaro.org>
To: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>,
	Amit Kucheria <amit.kucheria@oss.qualcomm.com>,
	Konrad Dybcio <konradybcio@kernel.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Kees Cook <kees@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
	linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
	linux-hardening@vger.kernel.org, manaf.pallikunhi@oss.qualcomm.com,
	Dipa Ramesh Mantre <dipa.mantre@oss.qualcomm.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: Re: [PATCH v7 9/9] arm64: dts: qcom: hamoa: Enable CDSP cooling
Message-ID: <amyFARId5K-Izco1@linaro.org>
References: <20260731-b4-qmi-tmd-v7-0-3befd44403d5@oss.qualcomm.com>
 <20260731-b4-qmi-tmd-v7-9-3befd44403d5@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260731-b4-qmi-tmd-v7-9-3befd44403d5@oss.qualcomm.com>

On Fri, Jul 31, 2026 at 04:03:49PM +0530, Gaurav Kohli wrote:
> From: Dipa Ramesh Mantre <dipa.mantre@oss.qualcomm.com>
> 
> Unlike the CPU, the CDSP does not throttle its speed automatically
> when it reaches high temperatures in hamoa.
> 
> Set up CDSP cooling by throttling the cdsp, when it reaches 95°C.
> 
> Add polling-delay-passive so the governor periodically evaluates
> the zone during passive cooling and steps up cooling levels when
> temperature stabilizes below the next trip.
> 

Would be good to mention why you are treating hamoa-iot-evk differently.

> Signed-off-by: Dipa Ramesh Mantre <dipa.mantre@oss.qualcomm.com>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts | 32 +++++++++++++++
>  arch/arm64/boot/dts/qcom/hamoa.dtsi        | 63 ++++++++++++++++++++++++++++++
>  2 files changed, 95 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts b/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts
> index 9fa86bb6438e..a146be1cb5fb 100644
> --- a/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts
> +++ b/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts
> @@ -1684,4 +1684,36 @@ trip-point0 {
>  			};
>  		};
>  	};
> +
> +	nsp0-thermal {
> +		trips {
> +			trip-point1 {
> +				temperature = <105000>;
> +			};
> +		};
> +	};
> +
> +	nsp1-thermal {
> +		trips {
> +			trip-point1 {
> +				temperature = <105000>;
> +			};
> +		};
> +	};
> +
> +	nsp2-thermal {
> +		trips {
> +			trip-point1 {
> +				temperature = <105000>;
> +			};
> +		};
> +	};
> +
> +	nsp3-thermal {
> +		trips {
> +			trip-point1 {
> +				temperature = <105000>;
> +			};
> +		};
> +	};
>  };

Please avoid overriding node values like this... One quick rename of one
of the involved nodes and this will be silently broken without compile
error. Nowadays dtbs_check will *probably* catch these, but if you
override values using the label reference you would notice it
immediately when compiling.

All those nodes already have a label you can use:

&nsp0_alert0 {
	temperature = <105000>;
};

&nsp1_alert0 {
	temperature = <105000>;
};

If the same pattern is already used for other thermal overrides in
hamoa-iot-evk.dts, it would be good to prepend a patch to fix those too.

Thanks,
Stephan
