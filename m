Return-Path: <joe@perches.com>
Message-ID: <1512511413.6321.94.camel@perches.com>
Subject: Re: [PATCH v5 1/5] soc: qcom: Introduce QMI encoder/decoder
From: Joe Perches <joe@perches.com>
Date: Tue, 05 Dec 2017 14:03:33 -0800
In-Reply-To: <20171205174310.15799-2-bjorn.andersson@linaro.org>
References: <20171205174310.15799-1-bjorn.andersson@linaro.org>
	 <20171205174310.15799-2-bjorn.andersson@linaro.org>
Content-Type: text/plain; charset="ISO-8859-1"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
To: Bjorn Andersson <bjorn.andersson@linaro.org>, Andy Gross <andy.gross@linaro.org>, Ohad Ben-Cohen <ohad@wizery.com>
Cc: Arun Kumar Neelakantam <aneela@codeaurora.org>, Chris Lew <clew@codeaurora.org>, Philippe Ombredanne <pombredanne@nexb.com>, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, linux-remoteproc@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

On Tue, 2017-12-05 at 09:43 -0800, Bjorn Andersson wrote:
> Add the helper library for encoding and decoding QMI encoded messages.
> The implementation is taken from lib/qmi_encdec.c of the Qualcomm kernel
> (msm-3.18).
> 
> Modifications has been made to the public API, source buffers has been
> made const and the debug-logging part was omitted, for now.
[]
> diff --git a/drivers/soc/qcom/qmi_encdec.c b/drivers/soc/qcom/qmi_encdec.c
[]
> +#define QMI_ENCDEC_ENCODE_TLV(type, length, p_dst) do { \
> +	*p_dst++ = type; \
> +	*p_dst++ = ((u8)((length) & 0xFF)); \
> +	*p_dst++ = ((u8)(((length) >> 8) & 0xFF)); \
> +} while (0)
> +
> +#define QMI_ENCDEC_DECODE_TLV(p_type, p_length, p_src) do { \
> +	*p_type = (u8)*p_src++; \
> +	*p_length = (u8)*p_src++; \
> +	*p_length |= ((u8)*p_src) << 8; \
> +} while (0)
> 
> +#define QMI_ENCDEC_DECODE_N_BYTES(p_dst, p_src, size) \
> +do { \
> +	memcpy(p_dst, p_src, size); \
> +	p_dst = (u8 *)p_dst + size; \
> +	p_src = (u8 *)p_src + size; \
> +} while (0)
> +

I dislike the asymmetric use of

p_dst being incremented by 3 and
p_src being incremented by 2 here

Is it really useful to have these macros do
any increments of arguments?

Why not a static inline and use a variant of
__be16_to_cpu/cpu_to_be16

> +static int qmi_encode_basic_elem(void *buf_dst, const void *buf_src,
> +				 u32 elem_len, u32 elem_size)
> +{
> +	u32 i, rc = 0;
> +
> +	for (i = 0; i < elem_len; i++) {
> +		QMI_ENCDEC_ENCODE_N_BYTES(buf_dst, buf_src, elem_size);
> +		rc += elem_size;
> +	}

I find this use obscure where buf_dst and buf_src are
both modified with an addition by the macro.
