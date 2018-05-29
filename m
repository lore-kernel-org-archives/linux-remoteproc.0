Return-Path: <arnaud.pouliquen@st.com>
Subject: Re: [PATCH 5/5] remoteproc: Introduce prepare and unprepare for
 subdevices
References: <20180515205345.8090-1-elder@linaro.org>
 <20180515205345.8090-6-elder@linaro.org>
 <3580eff5-56ef-c2a0-c8eb-c27850598587@st.com>
 <d2d120c3-a875-7feb-00a9-e8e4d3e4dfbe@linaro.org>
From: Arnaud Pouliquen <arnaud.pouliquen@st.com>
Message-ID: <b0bc8d99-2067-4ce0-fa36-3ac4d14d7b3c@st.com>
Date: Tue, 29 May 2018 14:31:08 +0200
MIME-Version: 1.0
In-Reply-To: <d2d120c3-a875-7feb-00a9-e8e4d3e4dfbe@linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
To: Alex Elder <elder@linaro.org>, ohad@wizery.com, bjorn.andersson@linaro.org
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>



On 05/29/2018 01:51 PM, Alex Elder wrote:
> On 05/29/2018 04:16 AM, Arnaud Pouliquen wrote:
> . . .
> 
>>> +unroll_preparation:
>>> +	list_for_each_entry_continue_reverse(subdev, &rproc->subdevs, node) {
>>> +		if (subdev->unprepare)
>>> +			subdev->unprepare(subdev);
>>> +	}
>> Here you could call rproc_unprepare_subdevices instead of duplicating
>> the code.
> 
> I thought the same thing, but it won't work because we only want to
> unprepare those devices that were successfully prepared.  Here we are
> unwinding the work that was partially done; in rproc_unprepare_subdevices()
> *all* subdevices have their unprepare function called.

You right, i missed the "continue"... new for me as i never used it,
thank for teaching!

Arnaud
