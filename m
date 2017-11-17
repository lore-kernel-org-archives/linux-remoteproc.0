Return-Path: <bjorn.andersson@linaro.org>
Date: Thu, 16 Nov 2017 22:10:34 -0800
From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH v3 1/5] soc: qcom: Introduce QMI encoder/decoder
Message-ID: <20171117061034.GS28761@minitux>
References: <20171115201012.25892-1-bjorn.andersson@linaro.org>
 <20171115201012.25892-2-bjorn.andersson@linaro.org>
 <c3b21557-d48e-925c-41a7-8f4ca7636be1@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c3b21557-d48e-925c-41a7-8f4ca7636be1@linaro.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc: Andy Gross <andy.gross@linaro.org>, Ohad Ben-Cohen <ohad@wizery.com>, Arun Kumar Neelakantam <aneela@codeaurora.org>, Chris Lew <clew@codeaurora.org>, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, linux-remoteproc@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

On Thu 16 Nov 04:10 PST 2017, Srinivas Kandagatla wrote:
> On 15/11/17 20:10, Bjorn Andersson wrote:
[..]
> > diff --git a/drivers/soc/qcom/Kconfig b/drivers/soc/qcom/Kconfig
> > index b00bccddcd3b..91b70b170a82 100644
> > --- a/drivers/soc/qcom/Kconfig
> > +++ b/drivers/soc/qcom/Kconfig
> > @@ -35,6 +35,14 @@ config QCOM_PM
> >   	  modes. It interface with various system drivers to put the cores in
> >   	  low power modes.
> > +config QCOM_QMI_HELPERS
> Should'nt this be part of second patch? atleast the patch subject suggests
> that its just enc/decoder but you are actually adding qmi helper symbol ?
> Or change the order of the patch.
> 

The encoder/decoder is, and should be, compilable on its own; so this
config option does ensure that the newly added c-file isn't just dead
code - although it's unlikely to matter in practice.

I don't see a reason for adding a QCOM_QMI_ENCDEC here and then rename
that in the following commit and I don't see a reason to split it in two
config options. So I think this is reasonable...

> > +	tristate
> we added help to this symbol but there is no promt text associated with it,
> so it will not show up as in menuconfig.. may be
> 
> tristate "QMI Helpers"
> 
> would be better
> 

The idea is that users of these functions would "select"
QCOM_QMI_HELPERS.

I don't think there is a particular point in allowing the user to select
this without any of the clients and a "depends on" in the client just
results in the user being forced to find this option to be able to
enable any of the clients.

[..]
> > diff --git a/drivers/soc/qcom/qmi_encdec.c b/drivers/soc/qcom/qmi_encdec.c
[..]
> > +#include <linux/io.h>
> 
> do we need this?
> 

Nope.

[..]
> > +/**
> > + * skip_to_next_elem() - Skip to next element in the structure to be encoded
> > + * @ei_array: Struct info describing the element to be skipped.
> > + * @level: Depth level of encoding/decoding to identify nested structures.
> > + *
> > + * Returns struct info of the next element that can be encoded.
> > + *
> 
> Should be Return: according to Documentation/doc-guide/kernel-doc.rst
> 
> Same comment appies to most of the functions..
> 

Thanks, I have been looking for that document! Will update the comments
throughout the patch series.

[..]
> > +/**
> > + * qmi_decode_string_elem() - Decodes elements of string data type
> > + * @ei_array: Struct info array descibing the string element.
> > + * @buf_dst: Buffer to store the decoded element.
> > + * @buf_src: Buffer containing the elements in QMI wire format.
> > + * @tlv_len: Total size of the encoded inforation corresponding to
> > + *           this string element.
> > + * @dec_level: Depth of the string element from the main structure.
> > + *
> > +
> 
> bad Line??

Looks like it.

> > + * Returns the total size of the decoded data elements on success, negative
> > + * errno on error.
> > +
> Dito..
> > + *
> > + * This function decodes the string element of maximum length
> > + * "ei_array->elem_len" from the source buffer "buf_src" and puts it into
> > + * the destination buffer "buf_dst". This function returns number of bytes
> > + * decoded from the input buffer.

And this should go above the "return" description.

[..]
> > +
> > +	rc = qmi_decode_basic_elem(buf_dst, buf_src + decoded_bytes,
> > +				   string_len, temp_ei->elem_size);
> > +	*((char *)buf_dst + string_len) = '\0';
> > +	decoded_bytes += rc;
> An empty line here could be nice... same for most of the functions..
> 

I agree, I'll run over the file again.

There are a few other style things that I would like to change, e.g.
replacing u32 with size_t in a bunch of places; but I also didn't want
to change too much from the downstream version.

But fixing the spacing in the initial commit makes sense.

[..]
> > diff --git a/include/linux/soc/qcom/qmi.h b/include/linux/soc/qcom/qmi.h
[..]
> > +#include <linux/qrtr.h>
> 
> Is this include needed as part of this patch?
> 

This should be able to go in the next patch.

> > +#include <linux/types.h>
> > +
> 
> > +
> > +enum qmi_array_type {
> > +	NO_ARRAY,
> > +	STATIC_ARRAY,
> > +	VAR_LEN_ARRAY,
> > +};
> > +
> > +/**
> > + * struct qmi_elem_info - describes how to encode a single QMI element
> > + * @data_type:	Data type of this element.
> > + * @elem_len:	Array length of this element, if an array.
> > + * @elem_size:	Size of a single instance of this data type.
> > + * @is_array:	Array type of this element.
> > + * @tlv_type:	QMI message specific type to identify which element
> > + *		is present in an incoming message.
> > + * @offset:	Specifies the offset of the first instance of this
> > + *		element in the data structure.
> > + * @ei_array:	Null-terminated array of @qmi_elem_info to describe nested
> > + *		structures.
> > + */
> > +struct qmi_elem_info {
> > +	enum qmi_elem_type data_type;
> > +	u32 elem_len;
> > +	u32 elem_size;
> > +	enum qmi_array_type is_array;
> 
> naming it array_type makes it more readable.
> 

Agreed.

[..]
> > +int qmi_decode_message(const void *buf, size_t len,
> > +		       struct qmi_elem_info *ei, void *c_struct);
> 
> Should we consider adding dummy functions to allow COMPILE_TEST on drivers
> using this api?
> 

Unfortunately drivers/soc/qcom isn't built unless ARCH_QCOM is set, but
I would prefer that we sort that out and have client drivers trigger the
build of this as well.

For other drivers I've seen the benefit of Coverity running on the x86
target, so this would be nice to do here too.


Thanks for the review!

Regards,
Bjorn
