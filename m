Return-Path: <jslaby@suse.com>
Subject: Re: [PATCH v7 2/2] tty: add rpmsg driver
References: <20200324170407.16470-1-arnaud.pouliquen@st.com>
 <20200324170407.16470-3-arnaud.pouliquen@st.com>
 <8821448b-3c6e-6277-06d2-9be7f81de9e9@infradead.org>
From: Jiri Slaby <jslaby@suse.com>
Message-ID: <4784b95f-0023-5250-ba9e-23b70b66611c@suse.com>
Date: Wed, 25 Mar 2020 09:10:24 +0100
MIME-Version: 1.0
In-Reply-To: <8821448b-3c6e-6277-06d2-9be7f81de9e9@infradead.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: Randy Dunlap <rdunlap@infradead.org>, Arnaud Pouliquen <arnaud.pouliquen@st.com>, Ohad Ben-Cohen <ohad@wizery.com>, Bjorn Andersson <bjorn.andersson@linaro.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org, Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: Suman Anna <s-anna@ti.com>, Fabien DESSENNE <fabien.dessenne@st.com>, linux-stm32@st-md-mailman.stormreply.com, Alan Cox <gnomes@lxorguk.ukuu.org.uk>, xiang xiao <xiaoxiang781216@gmail.com>
List-ID: <linux-remoteproc@vger.kernel.org>

Hi,

On 24. 03. 20, 18:44, Randy Dunlap wrote:
>> +  could be lost.
>> +- It can pause/resume reception by sending a control message (rely on CTS state).
>> +
>> +Control message structure:
>> +struct rpmsg_tty_ctrl {
>> +	u8 cts;			/* remote reception status */
>> +	u16 d_ept_addr;		/* data endpoint address */
>> +};
> 
> Is that struct packed or padded?

As it seems, this documentation is in contradiction with code, anyway:

+struct rpmsg_tty_ctrl {
+	u16 d_ept_addr;		/* data endpoint address */
+	u8 cts;			/* remote reception status */
+} __packed;

thanks,
-- 
js
suse labs
