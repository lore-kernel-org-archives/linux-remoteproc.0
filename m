Return-Path: <srinivas.kandagatla@linaro.org>
Return-Path: <srinivas.kandagatla@linaro.org>
Subject: Re: [PATCH v3 1/5] soc: qcom: Introduce QMI encoder/decoder
References: <20171115201012.25892-1-bjorn.andersson@linaro.org>
 <20171115201012.25892-2-bjorn.andersson@linaro.org>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <c3b21557-d48e-925c-41a7-8f4ca7636be1@linaro.org>
Date: Thu, 16 Nov 2017 12:10:45 +0000
MIME-Version: 1.0
In-Reply-To: <20171115201012.25892-2-bjorn.andersson@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: Bjorn Andersson <bjorn.andersson@linaro.org>, Andy Gross <andy.gross@linaro.org>, Ohad Ben-Cohen <ohad@wizery.com>
Cc: Arun Kumar Neelakantam <aneela@codeaurora.org>, Chris Lew <clew@codeaurora.org>, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, linux-remoteproc@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>



On 15/11/17 20:10, Bjorn Andersson wrote:
> Add the helper library for encoding and decoding QMI encoded messages.
> The implementation is taken from lib/qmi_encdec.c of the Qualcomm kernel
> (msm-3.18).
> 
> Modifications has been made to the public API, source buffers has been
> made const and the debug-logging part was omitted, for now.
> 
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---
> 
> Changes since v2:
> - Checkpatch fixes
> 
> Changes since v1:
> - None
> 
>   drivers/soc/qcom/Kconfig      |   8 +
>   drivers/soc/qcom/Makefile     |   2 +
>   drivers/soc/qcom/qmi_encdec.c | 821 ++++++++++++++++++++++++++++++++++++++++++
>   include/linux/soc/qcom/qmi.h  | 115 ++++++
>   4 files changed, 946 insertions(+)
>   create mode 100644 drivers/soc/qcom/qmi_encdec.c
>   create mode 100644 include/linux/soc/qcom/qmi.h
> 
I have tested this patch along with slimbus ngd for wcd9335 analog audio 
  playback.

Tested-By: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>

Few minor comments though!!

> diff --git a/drivers/soc/qcom/Kconfig b/drivers/soc/qcom/Kconfig
> index b00bccddcd3b..91b70b170a82 100644
> --- a/drivers/soc/qcom/Kconfig
> +++ b/drivers/soc/qcom/Kconfig
> @@ -35,6 +35,14 @@ config QCOM_PM
>   	  modes. It interface with various system drivers to put the cores in
>   	  low power modes.
>   
> +config QCOM_QMI_HELPERS
Should'nt this be part of second patch? atleast the patch subject 
suggests that its just enc/decoder but you are actually adding qmi 
helper symbol ?
Or change the order of the patch.

> +	tristate
we added help to this symbol but there is no promt text associated with 
it, so it will not show up as in menuconfig.. may be

tristate "QMI Helpers"

would be better


> +	help
> +	  Helper library for handling QMI encoded messages.  QMI encoded
> +	  messages are used in communication between the majority of QRTR
> +	  clients and this helpers provide the common functionality needed for
> +	  doing this from a kernel driver.
> +

>   config QCOM_SMEM
>   	tristate "Qualcomm Shared Memory Manager (SMEM)"
>   	depends on ARCH_QCOM
> diff --git a/drivers/soc/qcom/Makefile b/drivers/soc/qcom/Makefile
> index f151de41eb93..625750acfeef 100644
> --- a/drivers/soc/qcom/Makefile
> +++ b/drivers/soc/qcom/Makefile
> @@ -2,6 +2,8 @@ obj-$(CONFIG_QCOM_GLINK_SSR) +=	glink_ssr.o
>   obj-$(CONFIG_QCOM_GSBI)	+=	qcom_gsbi.o
>   obj-$(CONFIG_QCOM_MDT_LOADER)	+= mdt_loader.o
>   obj-$(CONFIG_QCOM_PM)	+=	spm.o
> +obj-$(CONFIG_QCOM_QMI_HELPERS)	+= qmi_helpers.o
> +qmi_helpers-y	+= qmi_encdec.o
>   obj-$(CONFIG_QCOM_SMD_RPM)	+= smd-rpm.o
>   obj-$(CONFIG_QCOM_SMEM) +=	smem.o
>   obj-$(CONFIG_QCOM_SMEM_STATE) += smem_state.o
> diff --git a/drivers/soc/qcom/qmi_encdec.c b/drivers/soc/qcom/qmi_encdec.c
> new file mode 100644
> index 000000000000..b446c6a9d5b0
> --- /dev/null
> +++ b/drivers/soc/qcom/qmi_encdec.c
> @@ -0,0 +1,821 @@
> +/*
> + * Copyright (c) 2012-2015, The Linux Foundation. All rights reserved.
> + * Copyright (C) 2017 Linaro Ltd.
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License version 2 and
> + * only version 2 as published by the Free Software Foundation.
> + *
> + * This program is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + * GNU General Public License for more details.
> + *
> + */
> +
> +#include <linux/slab.h>
> +#include <linux/uaccess.h>
> +#include <linux/module.h>
> +#include <linux/kernel.h>
> +#include <linux/errno.h>
> +#include <linux/io.h>

do we need this?

> +#include <linux/string.h>
> +#include <linux/soc/qcom/qmi.h>
> +static int qmi_encode(struct qmi_elem_info *ei_array, void *out_buf,
> +		      const void *in_c_struct, u32 out_buf_len,
> +		      int enc_level);
> +
> +static int qmi_decode(struct qmi_elem_info *ei_array, void *out_c_struct,
> +		      const void *in_buf, u32 in_buf_len, int dec_level);
> +
> +/**
> + * skip_to_next_elem() - Skip to next element in the structure to be encoded
> + * @ei_array: Struct info describing the element to be skipped.
> + * @level: Depth level of encoding/decoding to identify nested structures.
> + *
> + * Returns struct info of the next element that can be encoded.
> + *

Should be Return: according to Documentation/doc-guide/kernel-doc.rst

Same comment appies to most of the functions..


> + * This function is used while encoding optional elements. If the flag
> + * corresponding to an optional element is not set, then encoding the
> + * optional element can be skipped. This function can be used to perform
> + * that operation.
> + */
> +static struct qmi_elem_info *skip_to_next_elem(struct qmi_elem_info *ei_array,

> +/**
> + * qmi_decode_string_elem() - Decodes elements of string data type
> + * @ei_array: Struct info array descibing the string element.
> + * @buf_dst: Buffer to store the decoded element.
> + * @buf_src: Buffer containing the elements in QMI wire format.
> + * @tlv_len: Total size of the encoded inforation corresponding to
> + *           this string element.
> + * @dec_level: Depth of the string element from the main structure.
> + *
> +

bad Line??
> + * Returns the total size of the decoded data elements on success, negative
> + * errno on error.
> +
Dito..
> + *
> + * This function decodes the string element of maximum length
> + * "ei_array->elem_len" from the source buffer "buf_src" and puts it into
> + * the destination buffer "buf_dst". This function returns number of bytes
> + * decoded from the input buffer.
> + */
> +static int qmi_decode_string_elem(struct qmi_elem_info *ei_array,
> +				  void *buf_dst, const void *buf_src,
> +				  u32 tlv_len, int dec_level)
> +{
> +	int rc;
> +	int decoded_bytes = 0;
> +	u32 string_len = 0;
> +	u32 string_len_sz = 0;
> 
...
> +
> +	rc = qmi_decode_basic_elem(buf_dst, buf_src + decoded_bytes,
> +				   string_len, temp_ei->elem_size);
> +	*((char *)buf_dst + string_len) = '\0';
> +	decoded_bytes += rc;
An empty line here could be nice... same for most of the functions..

> +	return decoded_bytes;
> +}
> +
> +MODULE_LICENSE("GPL v2");
> diff --git a/include/linux/soc/qcom/qmi.h b/include/linux/soc/qcom/qmi.h
> new file mode 100644
> index 000000000000..5df7edfc6bfd
> --- /dev/null
> +++ b/include/linux/soc/qcom/qmi.h
> @@ -0,0 +1,115 @@
> +/*
> + * Copyright (c) 2012-2014, The Linux Foundation. All rights reserved.
> + * Copyright (c) 2017, Linaro Ltd.
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License version 2 and
> + * only version 2 as published by the Free Software Foundation.
> + *
> + * This program is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + * GNU General Public License for more details.
> + */
> +#ifndef __QMI_HELPERS_H__
> +#define __QMI_HELPERS_H__
> +
> +#include <linux/qrtr.h>

Is this include needed as part of this patch?

> +#include <linux/types.h>
> +

> +
> +enum qmi_array_type {
> +	NO_ARRAY,
> +	STATIC_ARRAY,
> +	VAR_LEN_ARRAY,
> +};
> +
> +/**
> + * struct qmi_elem_info - describes how to encode a single QMI element
> + * @data_type:	Data type of this element.
> + * @elem_len:	Array length of this element, if an array.
> + * @elem_size:	Size of a single instance of this data type.
> + * @is_array:	Array type of this element.
> + * @tlv_type:	QMI message specific type to identify which element
> + *		is present in an incoming message.
> + * @offset:	Specifies the offset of the first instance of this
> + *		element in the data structure.
> + * @ei_array:	Null-terminated array of @qmi_elem_info to describe nested
> + *		structures.
> + */
> +struct qmi_elem_info {
> +	enum qmi_elem_type data_type;
> +	u32 elem_len;
> +	u32 elem_size;
> +	enum qmi_array_type is_array;

naming it array_type makes it more readable.


> +	u8 tlv_type;
> +	u32 offset;
> +	struct qmi_elem_info *ei_array;
> +};
...
> +};
> +
> +extern struct qmi_elem_info qmi_response_type_v01_ei[];
> +
> +void *qmi_encode_message(int type, unsigned int msg_id, size_t *len,
> +			 unsigned int txn_id, struct qmi_elem_info *ei,
> +			 const void *c_struct);
> +
> +int qmi_decode_message(const void *buf, size_t len,
> +		       struct qmi_elem_info *ei, void *c_struct);

Should we consider adding dummy functions to allow COMPILE_TEST on 
drivers using this api?


> +
> +#endif
> 
